<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">


<html>
<head>
<xsl:comment>Se carga el css necesario para el uso de boostrap y la hoja de estilos css propia</xsl:comment>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"/>
<link href="styles.css" rel="stylesheet" type="text/css"/>

</head>

<xsl:comment>Se declara el body de lo que será nuestro html</xsl:comment>
<body>
    
<xsl:comment>Se declara una etiqueta h1 en la cual meto el titulo del html</xsl:comment>

<h1 id="titulo1">Museos madrid</h1>

<xsl:comment>Creo los contenedores div que van a albergar los contenedores responsive de boostrap</xsl:comment>

<div class="container-fluid">
		<div class="row">
  
  <xsl:comment> Creo un contenedor que ocupa 12 filas el cual es una imagen de cabecera para la página</xsl:comment>
  
			<div class="col-12 justify-content-center text-center">
				<img class="img-fluid rounded mx-auto d-block" src="1.jpg " width="50%" height="50%"/>
				<br></br>
			</div>

  <xsl:comment> Se crea el bucle for each el cuall servirá para replicar el modelo de distribucion de datos por cada museo que haya en el archivo xml</xsl:comment>
		
    <xsl:for-each select="/museos/museo">
    
  <xsl:comment>Declaro el div que voy a utilizar para meter informacion generica y relevante del museo mediante el uso de h5 para la cabecera del dato y h6 para la información del mismo</xsl:comment>
  
    <div class="col-12 justify-content-center text-center">
    
      <div class="accordion" id="accordionExample">
       <div class="accordion-item">
       
          <h2 class="accordion-header" id="headingOne">
           <button class="accordion-button,btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        <h2 id="centerbody"><xsl:value-of select="nombre"/></h2> 
           </button>
      
    </h2>
    
    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
      <h5 id="centerbodyred">ID DEL MUSEO</h5>
           <h6 id="centerbody1"><xsl:value-of select="id"/></h6> 
           
          <h5 id="centerbodyred">HORARIO DEL MUSEO</h5>
            <h6 id="centerbody1"><xsl:value-of select="horario"/></h6> 
            
          <h5 id="centerbodyred">TRANSPORTE ACCESIBLE</h5>
           <h6 id="centerbody1"><xsl:value-of select="transporte"/></h6> 
           
          <h5 id="centerbodyred">ACCESIBILIDAD</h5>
           <h6 id="centerbody1"><xsl:value-of select="accesibilidad"/></h6> 
           
           <h5 id="centerbodyred">PAGINA WEB</h5>
           <a style="text-decoration: none">
           <xsl:attribute name="href">
            <xsl:value-of select="web"/>
            </xsl:attribute>
          <h6 id="centerbody1">CLICK AQUI</h6> 
          
           </a>
      </div>
    </div>
  </div>
    
    </div>
  </div>
      
			
			  <xsl:comment>Declaro el div que alberga la descripción del museo</xsl:comment>

			
      <div class="col-12 justify-content-center text-center">
      <br></br>
      <div class="card w-100">
        <div class="card-body">
			  <h3 class="card-title">Amplia descripción del museo</h3>
			  <br></br>
        <p id="centerbody"><xsl:value-of select="desc"/></p> 
			</div>
			</div>
			<br></br>
			</div>

			
			  <xsl:comment> A continuación declaro 3 divs los cuales albergan información sobre la ubicacion del museo dividida por informaciión de la calle, informacion de la localidad y coordenadas, lontigutd y latitud</xsl:comment>
			  
  
  <div class="col-4 justify-content-center text-center">
          <p>
             <button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#boton1" aria-expanded="false" aria-controls="boton1">
                Información de la calle
              </button>
          </p>
  <div class="collapse" id="boton1">
  <div class="card card-body">
      <h3 id="titulo">Información de la calle</h3>
      <h5 id="centerbodyred">Nombre de la via</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/nombre-via"/></h6> 
      <h5 id="centerbodyred">Clase de la via</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/clase-via"/></h6> 
      <h5 id="centerbodyred">Numero de la via</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/numero"/></h6> 
      <h5 id="centerbodyred">Tipo de numero de la via</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/tipo-num"/></h6> 
			</div>
			</div>
			</div>
			
  <div class="col-4 justify-content-center text-center">
          <p>
             <button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#boton2" aria-expanded="false" aria-controls="boton2">
                Información localidad
              </button>
          </p>
    
<div class="collapse" id="boton2">
  <div class="card card-body">
      <h3 id="titulo">Información de localidad etc</h3>
        <h5 id="centerbodyred">Localidad</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/localidad"/></h6> 
        <h5 id="centerbodyred">Provincia</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/provincia"/></h6> 
        <h5 id="centerbodyred">Código postal</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/cp"/></h6> 
        <h5 id="centerbodyred">Barrio</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/barrio"/></h6> 
        <h5 id="centerbodyred">Distrito</h5>
        <h6 id="centerbody"><xsl:value-of select="localizacion/distrito"/></h6> 
			</div>
			</div>
			</div>
			
	
			
<div class="col-4 justify-content-center text-center">
          <p>
             <button class="btn btn-danger" type="button" data-bs-toggle="collapse" data-bs-target="#boton3" aria-expanded="false" aria-controls="boton3">
                Información ubicación
              </button>
          </p>
          
<div class="collapse" id="boton3">
  <div class="card card-body">
     <h3 id="titulo">Coordenadas, latitud y longitud</h3>
      <h5 id="centerbodyred">EJE X</h5>
      <h6 id="centerbody"><xsl:value-of select="localizacion/coordenada-x"/></h6> 
      <h5 id="centerbodyred">EJE Y</h5>
      <h6 id="centerbody"><xsl:value-of select="localizacion/coordenada-y"/></h6> 
      <h5 id="centerbodyred">Latitud</h5>
      <h6 id="centerbody"><xsl:value-of select="localizacion/latitud"/></h6>
      <h5 id="centerbodyred">Longitud</h5>
      <h6 id="centerbody"><xsl:value-of select="localizacion/longitud"/></h6>
      <h5 id ="centerbodyred">Link Maps</h5>
        <a style="text-decoration: none">
           <xsl:attribute name="href">
            <xsl:value-of select="localizacion/url"/>
            </xsl:attribute>
          <h6 id="centerbody">CLICK AQUI</h6> 
      </a>
  </div>
</div>
</div>

      
  <xsl:comment>Se crea el div que alberga la información de contacto del museo</xsl:comment>

    <div class="col-12 justify-content-center text-center">
    <br></br>
      <div class="card w-100">
        <div class="card-body">
            <h3 class="card-title">Información de contacto</h3>
              <h5 id="centerbodyred" class="card-text">Telefono</h5>
              <h6 id="centerbody" class="card-text"><xsl:value-of select="contacto/telefono"/></h6> 
              <h5 id="centerbodyred" class="card-text">E-mail</h5>
              <h6 id="centerbody" class="card-text"><xsl:value-of select="contacto/email"/></h6> 
        </div>
      </div>
      <br></br>
    </div>
      <hr></hr>
    </xsl:for-each>
        
  </div>
  </div>
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</body>
</html>
</xsl:template>
</xsl:stylesheet>