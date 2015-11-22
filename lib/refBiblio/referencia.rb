require 'date'

module RefBiblio
	class Referencia
		include Comparable
		attr_accessor :autor, :titulo, :editorial, :publicacion
		def initialize(autor, titulo, editorial, publicacion)
			#raise ArgumentError, "El autor no es un array" unless autor.is_a?(Array)
			#autor.each do |a|
			#	raise ArgumentError, "Uno de los autores no es un string" unless a.is_a?(String)
			#end
			#raise ArgumentError, "El titulo no es un string" unless titulo.is_a?(String)
			#raise ArgumentError, "La serie no es nulo o un string" unless serie.nil? || serie.is_a?(String)
			raise ArgumentError, "La editorial no es un string" unless titulo.is_a?(String)
			#raise ArgumentError, "La edicion no es un numero entero" unless edicion.is_a?(Integer)
			#raise ArgumentError, "La edicion no es un numero no valido" unless edicion > 0
			##raise ArgumentError, "La fecha no es de tipo Date" unless publicacion.is_a?(Date)
			#raise ArgumentError, "Los ISBN no son un array" unless isbn.is_a?(Array)
			#isbn.each do |i|
			#	raise ArgumentError, "Uno de los ISBN no es un string" unless i.is_a?(String)
			#end

			@autor = autor
			@titulo = titulo
			@editorial = editorial
			@publicacion = publicacion
		end
		
		def <=> (otro)
			@publicacion <=> otro.publicacion
		end
	end
	
	class Libro < Referencia
		attr_accessor :edicion, :isbn, :serie
		def initialize(autor, titulo, editorial, publicacion, edicion, isbn, serie=nil)
			super(autor,titulo,editorial,publicacion)
			@edicion = edicion
			@isbn = isbn
			@serie = serie
		end
			
			def to_s
			final = ""
			autor.each do |a|
				final << a
				final << ', ' unless a == autor.last
			end
			final << ".\n"
			final << titulo << "\n"
			final << serie << "\n" unless serie == nil
			final << editorial << "; " << edicion.to_s << " edition "
			final << "(" << Date::MONTHNAMES[publicacion.month] << " " << publicacion.day.to_s << ", " << publicacion.year.to_s << ")\n"
			isbn.each do |i|
				if(i.length < 12)
					final << "ISBN-10: " << i
				else
					final << "ISBN-13: " << i
				end
				final << "\n" unless i == isbn.last
			end
			return final
			end
	end
	
	class Periodicas < Referencia
		attr_accessor :issn, :numero, :tituloarticulo
		def initialize(autor, titulo, editorial, publicacion, tituloarticulo, numero, issn)
			super(autor,titulo,editorial,publicacion)
			@tituloarticulo = tituloarticulo
			@numero = numero
			@issn = issn
		end
	end
	
	
	class ArtRevista < Periodicas
		attr_accessor :pagina
		def initialize(autor, titulo, editorial, publicacion, tituloarticulo, numero, issn, pagina)
			super(autor,titulo,editorial,publicacion, tituloarticulo, numero, issn)
			@pagina = pagina
		end
		
		def to_s
			final = ""
			autor.each do |a|
				final << a
				final << ', ' unless a == autor.last
			end
			final << ".\n"
			final << titulo << "\n"
			final << editorial << "; "
			final << "(" << Date::MONTHNAMES[publicacion.month] << " " << publicacion.day.to_s << ", " << publicacion.year.to_s << ")\n"
			final << tituloarticulo << "\n"
			final << numero.to_s << "\n"
			final << "ISSN: " << issn[0] << "\n"
			pagina.each do |b|
				final << b
				final << ', ' unless b == pagina.last
			end
			return final
		end
	end
		
	class ArtPeriodico < Periodicas
		attr_accessor :seccion, :pagina
		def initialize(autor, titulo, editorial, publicacion, tituloarticulo, numero, issn, seccion, pagina)
			super(autor,titulo,editorial,publicacion, tituloarticulo, numero, issn)
			@seccion = seccion
			@pagina = pagina
		end
		
		def to_s
			final = ""
			autor.each do |a|
				final << a
				final << ', ' unless a == autor.last
			end
			final << ".\n"
			final << titulo << "\n"
			final << editorial << "; "
			final << "(" << Date::MONTHNAMES[publicacion.month] << " " << publicacion.day.to_s << ", " << publicacion.year.to_s << ")\n"
			final << tituloarticulo << "\n"
			final << numero.to_s << "\n"
			final << "ISSN: " << issn[0] << "\n"
			final << "Seccion: " << seccion << "\n"
			pagina.each do |b|
				final << b
				final << ', ' unless b == pagina.last
			end
			return final
		end
	end
	
	class DocElectronico < Periodicas
		attr_accessor :formato, :url
		def initialize(autor, titulo, editorial, publicacion, tituloarticulo, numero, issn, formato, url)
			super(autor,titulo,editorial,publicacion, tituloarticulo, numero, issn)
			@formato = formato
			@url = url
		end
		
		def to_s
			final = ""
			autor.each do |a|
				final << a
				final << ', ' unless a == autor.last
			end
			final << ".\n"
			final << titulo << "\n"
			final << editorial << "; "
			final << "(" << Date::MONTHNAMES[publicacion.month] << " " << publicacion.day.to_s << ", " << publicacion.year.to_s << ")\n"
			final << tituloarticulo << "\n"
			final << numero.to_s << "\n"
			final << "ISSN: " << issn[0] << "\n"
			final << "Formato: " << formato
			final << " URL: " << url << "\n"

			return final
		end
	end
end
