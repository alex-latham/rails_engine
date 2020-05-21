# Rails Engine

Rails Engine is a Turing School [module 3 project](https://backend.turing.io/module3/projects/rails_engine/) to explore API creation. It is tested against, in addition to the contained spec, the API consumption spec of [Rails Driver](https://github.com/turingschool-examples/rails_driver).

## Setup
The `import_data` rake task may take up to two minutes to complete. 5595 + 21687 + 4843 + 2483 + 100 + 1000 = 35708
```
$ git clone git@github.com:alex-latham/rails_engine.git
$ d rails_engine
$ bundle install
$ rake db:setup
$ rake import_data
```

## Rake Task Info
`rake import_data` destroys all model records and loads new data from CSV files located in app/data. These CSVs comprise 1000 customers, 100 merchants, 2483 items, 4843 invoices, 21687 invoice items, and 5595 transactions.

## Testing
There are a few ways to test this app:
1. Test the API endpoints by starting a localhost server with `$ rails server -p 3000` and hitting the endpoints listed below with a browser or other client such as Postman. Close the server with ctrl+c.
2. Run the included test suite: `$ bundle exec rspec`
3. Run the (Rails Driver)[https://github.com/turingschool-examples/rails_driver] test suite:
```
$ cd ..
$ git clone git@github.com:turingschool-examples/rails_driver.git
$ cd rails_driver
$ bundle install
$ figaro install
$ echo 'RAILS_ENGINE_DOMAIN: http://localhost:3000' > config/application.yml
$ bundle exec rspec
```
4. Run the Rails Driver server:
`$ rails server -p 3001`

## Requirements
* Ruby version
```
$ ruby -v
#=> ruby 2.5.3
```

* Rails version
```
$ rails version
#=> Rails 5.1.7
```

## API Endpoints
The following endpoints can be accessed:
### Merchants CRUD
* get http://localhost:3000/api/v1/merchants
* get http://localhost:3000/api/v1/merchants/:id
* get http://localhost:3000/api/v1/merchants/:id/items
* post http://localhost:3000/api/v1/merchants
* patch http://localhost:3000/api/v1/merchants/:id
* delete http://localhost:3000/api/v1/merchants/:id
### Items CRUD
* get http://localhost:3000/api/v1/items
* get http://localhost:3000/api/v1/items/:id
* get http://localhost:3000/api/v1/items/:id/merchant
* post http://localhost:3000/api/v1/items
* patch http://localhost:3000/api/v1/items/:id
* delete http://localhost:3000/api/v1/items/:id
### Name Searching
* get http://localhost:3000/api/v1/merchants/find?name=<search_param>
* get http://localhost:3000/api/v1/merchants/find_all?name=<search_param>
* get http://localhost:3000/api/v1/items/find?name=<search_param>
* get http://localhost:3000/api/v1/items/find_all?name=<search_param>
### Business Intelligence
* get http://localhost:3000/api/v1/merchants/most_revenue?quantity=<number>
* get http://localhost:3000/api/v1/merchants/most_items?quantity=<number>
* get http://localhost:3000/api/v1/merchants/revenue?start=<YYYY-MM-DD>&end=<YYYY-MM-DD>
