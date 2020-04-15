# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    Response: Vehicle has_many photos; Customer has_many appointments, employees; Employee has_many appointments, customers; Make has_many vehicles; Carname (model) has_many vehicles.
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Response: Vehicle belongs_to make, carname; Photo belongs_to vehicle; Appointment belongs_to customer, employee.
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
    Response: Customer has_many employees, through appointments; Employee has_many customers, through appointments.
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
    Response: Customer has_many employees, through appointments; Employee has_many customers, through appointments.
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
    Response: Appointments join table has a type, description, date, and time.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
    Response: Appointments: Validates presence of description, date, and time.  Custom validation for date (must be today or later).  Custom validation for time (must be greater than one hour in the future if appointment date is today); Customer: Validates presence of name and email as well as uniqueness of email.  Added validation for confirmation of password; Employee: Same validations as customer; Vehicle: Validates presence of price, year, mileage, and description.
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Response: I enjoyed creating methods to enable searching, ordering, and filtering vehicle inventory.  In the vehicle.rb model there are several class level methods including .order_by_make, .order_by_year as well as filters .by_make, and .by_model.  These methods are accessed from buttons and dropdowns on the main vehicle index page (customer view).  I also added class methods in make.rb and carname.rb (models) to remove duplicate values used in collection_select tags in the new vehicle and edit vehicle views.
- [x] Include signup (how e.g. Devise)
    Response: I didn't use Devise, but built basic signups for both customers and employees (employees are set up via an admin function).
- [x] Include login (how e.g. Devise)
    Response: Login is enabled for both customers and employees.
- [x] Include logout (how e.g. Devise)
    Response: This is enabled for both customers and employees.
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    Response: I used OmniAuth to enable Facebook signup/login.  It works great.
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    Response: The customer appointments are nested such that an appointment (or appointment index) is for a particular customer.  For example, an index of appointments for customer 1 has the route: customers/1/appointments.  To edit a specific appointment the route might be: customers/1/appointments/1/edit.
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    Response: New appointments use a similar route: customers/1/appointments/new.
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    Response: I added lots of validation messages using both flash notices / alerts and model validation errors.  If a user types "appointments/new" they are taken back to the home page and a flash alert message appears "Please login to make an appointment."

Confirm:
- [x] The application is pretty DRY
    Response: I created customer and employee validation methods in application_controller as well as customer validation helper methods.
- [x] Limited logic in controllers
    Response: I added several before_action methods in the controllers such as #find_vehicle and #get_appointment.  I also utilized the customer and employee validation methods in application_controller. 
- [x] Views use helper methods if appropriate
    Response: I set up helper methods in sessions_helper used in views to retrieve customers & employees as well as verify they are logged in.
- [x] Views use partials if appropriate
    Response: I used partials for employees, vehicles, appointments, and customers which work really well.  I also used two layouts: the default application layout is for customer views and an admin layout is used with admin related views.
