declare option output:omit-xml-declaration "no";
processing-instruction xml-stylesheet {'type=application/xml', 'href="style.xsl"'},

<museos>
(:Se declara la variable x la cual hace referencia al documento xml del que se van a extraer los datos y posteriormente se accede a contenidos/contenido:)
{for $x in doc("https://datos.madrid.es/egob/catalogo/201132-0-museos.xml")/Contenidos/contenido
return
(: Se declara otro for en el cual se declara la variable museo la cual accede a la variable x previamente declarada y a atributos que es donde se encuentran los datos:)
   for $museo in $x/atributos
    return
   <museo>
   (:Se extraen los datos generales del museo:)
    <id>{$museo/atributo[@nombre="ID-ENTIDAD"]/text()}</id>
    <nombre>{$museo/atributo[@nombre="NOMBRE"]/text()}</nombre>
    <desc>{$museo/atributo[@nombre="DESCRIPCION-ENTIDAD"]/text()}</desc>
    <horario>{$museo/atributo[@nombre="HORARIO"]/text()}</horario>
    <transporte>{$museo/atributo[@nombre="TRANSPORTE"]/text()}</transporte>
    <accesibilidad>{$museo/atributo[@nombre="ACCESIBILIDAD"]/text()}</accesibilidad>
    <web>{$museo/atributo[@nombre="CONTENT-URL"]/text()}</web>
    (:Se extraen los datos de la ubicacion del museo:)
    <localizacion>{$museo/atributo[@nombre="LOCALIZACION"]/text()}
      <nombre-via>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="NOMBRE-VIA"]/text()}</nombre-via>
      <clase-via>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="CLASE-VIAL"]/text()}</clase-via>
      <tipo-num>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="TIPO-NUM"]/text()}</tipo-num>
      <numero>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="NUM"]/text()}</numero>
      <localidad>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="LOCALIDAD"]/text()}</localidad>
      <provincia>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="PROVINCIA"]/text()}</provincia>
      <cp>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="CODIGO-POSTAL"]/text()}</cp>
      <barrio>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="BARRIO"]/text()}</barrio>
      <distrito>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="DISTRITO"]/text()}</distrito>
      <coordenada-x>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="COORDENADA-X"]/text()}</coordenada-x>
      <coordenada-y>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="COORDENADA-Y"]/text()}</coordenada-y>
      <latitud>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="LATITUD"]/text()}</latitud>
      <longitud>{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="LONGITUD"]/text()}</longitud>
      <url>https://www.google.com/maps?q={$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="LATITUD"]/text()},{$museo/atributo[@nombre="LOCALIZACION"]/atributo[@nombre="LONGITUD"]/text()}</url>
    </localizacion>
    (:Se extraen los datos de contacto del museo:)
    <contacto>{$museo/atributo[@nombre="DATOSCONTACTOS"]/text()}
      <telefono>{$museo/atributo[@nombre="DATOSCONTACTOS"]/atributo[@nombre="TELEFONO"]/text()}</telefono>
      <email>{$museo/atributo[@nombre="DATOSCONTACTOS"]/atributo[@nombre="EMAIL"]/text()}</email>
    </contacto>
  </museo>}
</museos>




       
       
       