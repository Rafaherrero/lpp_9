#Práctica 6 de LPP
##Gema para la referencias de libros

###Enunciado
En esta práctica debemos desarrollar una gema que nos permita almacenar información ordenada de forma lógica sobre referencias de libros. Para llevar a cabo este objetivo, implementaremos una clase en Ruby siguiendo la metodología de desarrollo dirigido por pruebas (*Test Driven Development - TDD*).

###Diseño
La estructura de directorio es la siguiente:

    prct06
    ├── bin
    │   ├── console
    │   └── setup
    ├── CODE_OF_CONDUCT.md
    ├── Gemfile
    ├── Gemfile.lock
    ├── lib
    │   ├── refBiblio
    │   │   ├── referencia.rb
    │   │   └── version.rb
    │   └── refBiblio.rb
    ├── LICENSE.txt
    ├── Rakefile
    ├── README.md
    ├── refBiblio.gemspec
    └── spec
        ├── referencia_spec.rb
        └── spec_helper.rb

Lo más imporante es:

* **refBiblio.gemspec**: Este fichero contiene toda la información relacionada con la gema, como el nombre de la misma, sus autores y sus correos electrónicos, una descripción de la gema, etc.
* **lib**: En este directorio se almacena todo el código fuente para la gema.
* **spec**: En este directorio mantienen los distintos ficheros de espectativas para el código que se encuentra en lib.

###Desarrollo

En primer lugar, debemos inicializar crear el directorio básico para la gema:

    bundle gem refBiblio

Y el bundle nos creará automáticamente toda la estructura de directorio, y además nos inicializa un repositorio `git`

    Creating gem 'refBiblio'...
          create  refBiblio/Gemfile
          create  refBiblio/.gitignore
          create  refBiblio/lib/refBiblio.rb
          create  refBiblio/lib/refBiblio/version.rb
          create  refBiblio/refBiblio.gemspec
          create  refBiblio/Rakefile
          create  refBiblio/README.md
          create  refBiblio/bin/console
          create  refBiblio/bin/setup
          create  refBiblio/.travis.yml
    Initializing git repo in /home/daniel/clase/lpp/test/refBiblio

Una vez creada la estructura de directorio, necesitamos instalar las dependencias de nuestra gema, para ello añadimos en el `refBiblio.gemspec` la línea `spec.add_development_dependency "rspec", "~> 2.11"`. En este punto, bundle ya sabe que gemas necesitamos instalar para poder desarrollar nuestra gema, así que las instalamos:

    bundle install

Ya por último, debemos hacer la estructura para las pruebas. De nuevo se puede crear de forma automática, escribiendo el siguiente comando:

    bundle exec rspec --init

Este comando nos creará los ficheros básicos para crear las espectativas.

    $ bundle exec rspec --init
      create   .rspec
      create   spec/spec_helper.rb

En este punto tenemos lista la estructura de directorio para empezar a crear la gema. Sólo tenemos que empezar a añadir pruebas en el directorio `spec` y crear el código necesario para pasar la prueba en `lib/refBiblio` siguiendo la metodología TDD

#### Metodología TDD
1. Escribir una prueba.
2. Ejecutar la prueba y observar que falla (porque no hay ningún código todavía para que la pase).
3. Escribir la cantidad mínima de coddigo como para pasar la prueba.
4. Refactorizar el código para que quede más limpio y mejor escrito.
5. Si la prueba falla después de la refactorización, entonces compenzar el proceso de refactorización otra vez.