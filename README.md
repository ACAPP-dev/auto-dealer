# Auto Dealer Website

Website to view an auto dealer's vehicle inventory and make sales or service appointments at that dealership.

## Features

### Customers
<ul>
    <li>View vehicles in inventory.</li>
    <li>View vehicle details, options, and photos.</li>
    <li>Search for a particular vehicle year, make, or model.</li>
    <li>Filter inventory by make or model.</li>
    <li>Order inventory by price, make, or year.</li>
    <li>View, create, modify, and cancel appointments.</li>
    <li>Create a unique customer account with a secure password.</li>
    <li>Option to use Facebook account for login.</li>
</ul>

### Employees / Owners
<ul>
    <li>Admin functions for employees, managing vehicle inventory and more.</li>
    <li>Create, modify, and delete employees.</li>
    <li>Assign employees an access level: 100-view only, 200-edit, 300-delete items.</li>
    <li>View all appointments in order by date</li>
</ul>

Please use the following link to see an overview of the webapp on YouTube: NEED

My blog also talks about this project here: NEED

## Installation

Written with Ruby version 2.6.3p62 using Ruby on Rails Framework.

Uses a Sqlite3 database.  To refresh or set up the database, use the following steps:

    $ rails db:drop

    $ rails db:migrate

    $ rails db:seed


Download the code for this webapp using:

    $ git clone https://github.com/ACAPP-dev/auto-dealer.git

Update Gem files using command:

    $ bundle install 
    
    or
    
    $ bundle update

## Development

    You can use:
    
    $ rails s
            
    to start webserver.
    
    Use:

    $ rails c

    to enter a console session for debugging and/or exploring.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ACAPP-dev/auto-dealer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

Written by **Andrew Capp** in conjunction with _Flatiron Academy_ - April 2020

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ACAPP-dev/auto-dealer/blob/master/CODE_OF_CONDUCT.md).