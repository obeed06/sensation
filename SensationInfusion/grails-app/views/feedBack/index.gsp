<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript">

$(document).ready(function() {

	$('#onlineForm a:first').tab('show');

});

</script>
<title>Feedback</title>
</head>
<body>
	<g:include view="layouts/headerBanner.gsp"/>
	<div class="container">

		<g:include view="layouts/menuHeader.gsp" params="[active: 'contact']" />

		<h1>CONTACT US ONLINE</h1>
		<br>

		<ul class="nav nav-tabs">
		  <li class="active"><a href="#onlineForm" data-toggle="tab">Online Form</a></li>
		  <li><a href="#order" data-toggle="tab">Order</a></li>
		</ul>
		
		<div class="tab-content">
		  	<div class="tab-pane active" id="onlineForm">
		  	
		  		<h3>Online Form</h3>

				<g:if test="${confMsg}">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>						
						${confMsg}
					</div>
				</g:if>
				(Please complete all fields)
				<g:form class="form-horizontal" action="sendFeedBack" controller="feedBack">
				
					<div class="form-group ${hasErrors(bean:feedBack,field:'name', 'has-error')}">
						<label class="col-lg-2 control-label" for="name">Your Name</label>
					    <div class="col-lg-5">
							<input class="form-control" type="text"	name="name" id="name" value="${fieldValue(bean:feedBack, field:'name')}">
						    <g:hasErrors bean="${feedBack}" field="name">
						    	<span class="help-inline">
						    	       <g:renderErrors bean="${feedBack}" field="name" as="list" />							    	
						    	</span>
						    </g:hasErrors>								
						</div>
					</div>
					<div class="form-group ${hasErrors(bean:feedBack,field:'email', 'has-error')}">						
						<label class="col-lg-2 control-label" for="email">Your Email</label>
					    <div class="col-lg-5" >	
							<input class="form-control" type="text" value="${fieldValue(bean:feedBack,field:'email')}" name="email" id="email">
							<g:hasErrors bean="${feedBack}" field="email">
						    	<span class="help-inline">
						    	       <g:renderErrors bean="${feedBack}" field="email" as="list" />							    	
						    	</span>
						    </g:hasErrors>
						</div>
					</div>
					<div class="form-group ${hasErrors(bean:feedBack,field:'topic','has-error')}">
						<label class="col-lg-2 control-label" for="topic">Tell us what you want to write to us about</label>
					    <div class="col-lg-5 ">
							<g:select class="form-control" name="topic" from="${feedBackOptions}" optionValue="displayName" value="${fieldValue(bean:feedBack,field:'topic')}" />
						</div>
					</div>
					<div class="form-group ${hasErrors(bean:feedBack,field:'messageTitle', 'has-error')}">				
						<label class="col-lg-2 control-label" for="messageTitle">Message Title</label>
					    <div class="col-lg-5">
							<g:textField class="form-control" value="${fieldValue(bean:feedBack,field:'messageTitle')}" name="messageTitle" id="messageTitle"></g:textField>
							<g:hasErrors bean="${feedBack}" field="name">
						    	<span class="help-inline">
						    	       <g:renderErrors bean="${feedBack}" field="messageTitle" as="list" />							    	
						    	</span>
						    </g:hasErrors>
						</div>
					</div>
					<div class="form-group ${hasErrors(bean:feedBack,field:'message', 'has-error')}">
						<label class="col-lg-2 control-label" for="message">Your message<br>(Maximum 1500 characters)</label>
					    <div class="col-lg-5">
							<g:textArea class="form-control" name="message" id="message" rows="5" cols="50"s value="${fieldValue(bean:feedBack,field:'message')}"></g:textArea>
							<g:hasErrors bean="${feedBack}" field="message">
						    	<span class="help-inline">
						    	       <g:renderErrors bean="${feedBack}" field="message" as="list" />							    	
						    	</span>
						    </g:hasErrors>
						</div>
					</div>
					<div>
						<input class="btn" type="submit" value="Submit">
					</div>
				</g:form>
		  	</div>
		  	<div class="tab-pane" id="order">
		  		<h3>Order</h3>

				<p>While we're working on our online ordering system. 
				
				You can get in contact in the following ways:
				</p>
				<dl class="dl-horizontal">
				  	<dt>Call Us On</dt>
				  	<dd>07794849350</dd>
				  	<dt>Email</dt>
				  	<dd><a href="mailto:#">sensation_infusion@hotmail.co.uk</a></dd>
				</dl>
		  	</div>
		</div>
		<g:include view="layouts/footer.gsp" />
	</div>
</body>
</html>