<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${resource(dir: 'css', file: 'styles.css')}" rel="stylesheet" type="text/css"></link>
<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="${resource(dir: 'js', file: 'jquery-1.8.2.min.js')}"></script>
<script type="text/javascript" src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
<div id="header">
<div class="navbar navbar-inverse">

    <!-- .navbar-toggle is used as the toggle for collapsed navbar content -->
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>

    <a class="navbar-brand" href="#">Sensation</a>
	<div class="nav-collapse collapse navbar-responsive-collapse">
	
	<ul class="nav navbar-nav">
		<g:if test="${params.active == 'home' }">
			<li class='active '><g:link controller="home" action="homePage">Home</g:link></li>
		</g:if>
	   	<g:else>
	   		<li><g:link controller="home" action="homePage"><i class="icon-home"></i>Home</g:link></li>
	   	</g:else>
		
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">Products<b class="caret"></b></a>
 	      	<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu">
	         	<li><g:link controller="product" action="productList" params="[categoryName: 'Spirits']">Spirits</g:link></li>
	        	<li><g:link controller="product" action="productList" params="[categoryName: 'Ginger Beer']">Ginger Beer</g:link></li>
	  		</ul>
	     </li>
	   <g:if test="${params.active == 'cocktails' }">
	      <li class='active'><g:link controller="cocktail"><span>Cocktails</span></g:link></li>
	   </g:if>
	   <g:else>
	      <li><g:link controller="cocktail"><span>Cocktails</span></g:link></li>
	   </g:else>
	   <g:if test="${params.active == 'events' }">
	   		<li class='active'><g:link controller="event"><span>Where to Find Us</span></g:link></li>
	   </g:if>
	   <g:else>
	      <li><g:link controller="event"><span>Where to Find Us</span></g:link></li>   
	   </g:else>
	   <g:if test="${params.active == 'about' }">
	      <li class='active'><g:link controller="aboutUs"><span>About</span></g:link></li>   
	   </g:if>
	   <g:else>
	      <li><g:link controller="aboutUs"><span>About</span></g:link></li>
	   </g:else>
	   <g:if test="${params.active == 'contact' }" >
	      <li class='active'><g:link controller="feedBack"><span>Contact</span></g:link></li>
	   </g:if>
	   <g:else>
	      <li><g:link controller="feedBack"><span>Contact</span></g:link></li>
	   
	   </g:else>
	</ul>
	<g:form controller="siteSearch" action="search" method="get" class="navbar-form pull-right">
		<input type="text" class="form-control col-lg-8" placeholder="Search" name="q" value="${params.q}">
    </g:form>
    </div>
</div>
</div>


