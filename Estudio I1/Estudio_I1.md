# Estudio I1

## Conceptos básicos SAAS

Saas (Software as service)  -> Aplicaciones web

### Ventajas

- No hay que instalar SO especifico
- No hay que instalar cosas para que funcione
- Interacción online directa y natural
- Siempre actualizado
- No hay riesgo de pérdida de datos
- No se ocupa espacio en el computador

### Cómo funciona

`Browser` envía una solicitud (HTTP) que es procesada por el `servidor web` (WEBrick) quien obtiene el contenido de la `aplicación` (Ruby on Rails) quien genera una vista (HTML+CSS) y la devuelve al browser que la despliega.

Browser --HTTP-> Servidor --RoR-> Aplicación --HTML-> Browser

El contenido persistente de la aplicación se almacena en una base de datos (BD). La BD se relaciona con la aplicación a través del `ActiveRecord`

## Ruby

### Clases

```ruby
$globalVariable #Global como el dolar

class Sample
  @instanceAttribute
  @@classAttribute
  def initialize(param1)
    @param1 = param1
  end
end

instance = new Sample(parameter)
lista = [1,3,6,5]
lista.sort() #devuelve lista ordenada
lista.sort()! #Hace que lista sea igual a la lista ordenada
```

Mixins: Set de funcionalidades que se pueden agregar a una clase<br>Gem: Unidad funcional importable en ruby. Ej: Devise para manejo de cuentas de usuario.

## Ruby on Rails

Es un framework, es decir, un conjunto de librerías y estructuras que hacen más fácil y rápido el desarrollo de aplicaciónes web.

### Máximas

- Convention over configuration
- Dont repeat yourself

### Organización

Una aplicación de RoR tiene:

- Models: Entidades de la aplicación (como clases)
- Controllers: Mediadores entre modells y views. Es una clase cuyos métodos son las acciones que pudede realizar.(Ej: index, show, new, create, edit, update, destroy)
- Views: Es lo que recibe el usuario y con lo que interactúa. Son las instrucciones de cómo generar el html

### Comandos importantes

```shell
rails new AppName # Crea nueva applicación
rails s # Inicia el servidor en localhost:3000
bundle install # Instala gemas
rake db:migrate # Actualiza base de datos
```

### Archivos importantes

#### /config/routes.rb

Contiene las redirecciones de la aplicación

#### /gemfile

Contiene la importación de todas las gemas de la aplicación

### ActiveRecord

Asocia las clases con las tablas de la base de datos. Ej: relaciona la clase `Sample` con la tabla `samples`

#### Crear

```ruby
book = Book.new
book.title = "Rails for Dummies"
book.published_at = "2010-03-22"
book.save # NO OLVIDAR!
```

```ruby
Book.create(:title =>"Rails for Dummies", :published_at =>
"2010-03-22")
```

#### Buscar

```ruby
Book.find(:id)
Book.where(:title => "Rails for Dummies").first
```

## Rspec

- Behaviour testing development: "**that** it works" over "**how** it works".

Agregar al `gemfile`

```ruby
group :development, :test do
  gem 'rspec-rails', '~> 3.1'
 gem 'factory_girl_rails', '~> 4.4.1'
```

En consola

```ruby
rails generate rspec:install
rspec --init
```

En `spec/models/project_spec.rb`

```ruby
require 'rails_helper'
Rspec.describe Clase do
  it "spec description" do
    clase = Clase.new
    expect(clase.method).to be_truthy
  end
  it "segundo spec" do
    clase = Clase.new
    expect(clase.metho2).to be_equal_to(20)
  end
end
```

### Expects varios

- expect(array).to all(matcher)
- expect(actual).to be_truthy
- expect(actual).to be_falsy
- expect(actual).to be_nil
- expect(actual).to be_between(min, max)
- expect(actual).to be_within(delta).of(actual)
- expect { block }.to change(receiver, message, &block)
- expect(actual).to contain_exactly(expected)
- expect(actual).to eq(actual)
- expect(actual).to have_attributes(key/value pairs)
- expect(actual).to include(expected)
- expect(actual).to match(regex)
- expect { block }.to raise_error(exception)
- expect(actual).to satisfy { block }

Para correr test. En consola

```ruby
rspec --init
```

## SCRUM

Metodología de desarrollo de software que permite tener requerimientos dinámicos. Incremento funcional.  

- Backlog: Lista priorizada de features.
- Sprint: Etapa de desarrollo en la que se implementarán una lista definida de features (sprint backlog) según prioridad en un tiempo determinado (max 4 semanas). Se diseña, programa y testea. Backlog: Lista priorizada de features
- Daily Srum: Reunión diaria breve en que se revisa qué se hizo el día anterior y que se hará ese día. Se hace de pie.
- Sprint review: Se analiza y adapta el desarrollo del producto. Incluye al cliente
- Sprint Retrospective: Se analiza como fue el proceso del sprint.

### Roles

- Product Owner: Es el encargado de la planificación, decide qué features implementar en los sprint. Representa al usuario en el equipo de desarrollo.
- Scrum master: Liderazgo del team
- Team: Los que realizar en desarrollo, ellos deciden cómo.
