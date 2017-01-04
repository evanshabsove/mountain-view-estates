require 'csv'
namespace :import_special_products_csv do
  task :create_products => :environment do
    csv_text = File.read("/home/evanshabsove/Documents/mountainViewEstates/special_order_items.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      SpecialProduct.create!(row.to_hash)
    end
  end
end
