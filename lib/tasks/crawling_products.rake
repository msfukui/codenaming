require 'find'
require_relative 'ripper_wrapper'

namespace :crawling_products do
  desc 'Crawling all products'

  task :uncrawling_products => :environment do
    logger = Logger.new('log/crawling_products.log')

    Product.all.each do |product|
      logger.info "#{Time.now} : crawling_product : start : #{product.name}"

      unless File.directory?("tmp/#{product.name}-#{product.version}")
        begin
          system("git clone #{product.path} tmp/#{product.name}-#{product.version}")
        rescue => e
          logger.error "#{Time.now} : git_error : #{product.name} : #{$?}(#{e})"
          raise
        end
      end

      Find.find( "tmp/#{product.name}-#{product.version}" ) do |file|
        unless File.directory?(file)
          if file =~ /\.rb$/
            rw = RipperWrapper.new(File.open(file).read)
            rw.parse
            rw.code[:classes].each do |i|
              Item.new(
                product_id: product.id,
                kind:       :class,
                name:       i[:class],
                file:       file
              ).save
            end
            rw.code[:modules].each do |i|
              Item.new(
                product_id: product.id,
                kind:       :module,
                name:       i[:module],
                file:       file
              ).save
            end
            rw.code[:methods].each do |i|
              Item.new(
                product_id: product.id,
                kind:       :method,
                name:       i[:def],
                file:       file
              ).save
            end
          end
        end
      end

      begin
        system("rm -fr tmp/#{product.name}-#{product.version}")
      rescue => e
        logger.error "#{Time.now} : rm_error : #{product.name} : #{$?}(#{e})"
        raise
      end

    end

    logger.close
  end
end
