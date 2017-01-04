require 'csv'
namespace :import_inventory_products_csv do
  task :create_products => :environment do
    csv_text = File.read("/home/evanshabsove/Documents/mountainViewEstates/inventory_products.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      InventoryProduct.create!(row.to_hash)
    end
  end
end
