# Railswizard

A tool to create a new rails app with RailsWizard(http://railswizard.org) template

## Installation
    $ gem install railswizard

## Usage
```
$ railswizard list
+---------------+---------------+----------------+
| Name          | Key           | Category       |
+---------------+---------------+----------------+
| ActiveRecord  | activerecord  | persistence    |
| Capybara      | capybara      | testing        |
| Cucumber      | cucumber      | testing        |
| Devise        | devise        | authentication |
| EnvYAML       | env_yaml      | other          |
| Git           | git           | other          |
| HAML          | haml          | templating     |
| Heroku        | heroku        | deployment     |
+---------------+---------------+----------------+

$ railswizard new app_name activerecord capybara cucumber
```
