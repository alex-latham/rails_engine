require 'csv'

desc "Import Data"
task import_data: :environment do
  num_transactions = Transaction.all.length
  Transaction.destroy_all
  p "#{num_transactions} transactions destroyed,"

  num_invoice_items = InvoiceItem.all.length
  InvoiceItem.destroy_all
  p "#{num_invoice_items} invoice items destroyed,"

  num_invoices = Invoice.all.length
  Invoice.destroy_all
  p "#{num_invoices} invoices destroyed,"

  num_items = Item.all.length
  Item.destroy_all
  p "#{num_items} items destroyed,"

  num_merchants = Merchant.all.length
  Merchant.destroy_all
  p "#{num_merchants} merchants destroyed,"

  num_customers = Customer.all.length
  Customer.destroy_all
  p "#{num_customers} customers destroyed,"

  customers = CSV.parse(File.open('./data/customers.csv'),
    headers: true,
    header_converters: :symbol
  )

  customers.each do |row|
    Customer.create({
      id:         row[0],
      first_name: row[1],
      last_name:  row[2],
      created_at: row[3],
      updated_at: row[4]
    })
  end

  p "#{Customer.all.length} customers created,"

  merchants = CSV.parse(File.read('./data/merchants.csv'),
    headers: true,
    header_converters: :symbol
  )

  merchants.each do |row|
    Merchant.create({
      id:         row[0],
      name:       row[1],
      created_at: row[2],
      updated_at: row[3]
    })
  end

  p "#{Merchant.all.length} merchants created,"

  items = CSV.parse(File.read('./data/items.csv'),
    headers: true,
    header_converters: :symbol
  )

  items.each do |row|
    Item.create({
      id:          row[0],
      name:        row[1],
      description: row[2],
      unit_price:  row[3].to_f / 100,
      merchant_id: row[4],
      created_at:  row[5],
      updated_at:  row[6]
    })
  end

  p "#{Item.all.length} items created,"

  invoices = CSV.parse(File.read('./data/invoices.csv'),
    headers: true,
    header_converters: :symbol
  )

  invoices.each do |row|
    Invoice.create({
      id:          row[0],
      customer_id: row[1],
      merchant_id: row[2],
      status:      row[3],
      created_at:  row[4],
      updated_at:  row[5]
    })
  end

  p "#{Invoice.all.length} invoices created,"

  invoice_items = CSV.parse(File.read('./data/invoice_items.csv'),
    headers: true,
    header_converters: :symbol
  )

  invoice_items.each do |row|
    InvoiceItem.create({
      id:         row[0],
      item_id:    row[1],
      invoice_id: row[2],
      quantity:   row[3],
      unit_price: row[4].to_f / 100,
      created_at: row[5],
      updated_at: row[6]
    })
  end

  p "#{InvoiceItem.all.length} invoice items created,"

  transactions = CSV.parse(File.read('./data/transactions.csv'),
    headers: true,
    header_converters: :symbol
  )

  transactions.each do |row|
    Transaction.create({
      id:                          row[0],
      invoice_id:                  row[1],
      credit_card_number:          row[2],
      credit_card_expiration_date: row[3],
      result:                      row[4],
      created_at:                  row[5],
      updated_at:                  row[6]
    })
  end

  p "#{Transaction.all.length} transactions created,"

  ActiveRecord::Base.connection.tables.each do |t|
    ActiveRecord::Base.connection.reset_pk_sequence!(t)
  end

  p "Import complete."
end
