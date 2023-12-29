<nav class="navbar navbar-expand-lg navbar-light bg-light py-3">
	<div class="container">
		<a class="navbar-brand" href="index.jsp">Supermarket</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>

				<%
				if (auth != null) {
				%>
					<li class="nav-item"><a class="nav-link" href="addProduct.jsp">Add Product</a></li>
				<li class="nav-item"><a class="nav-link" href="adminProductView.jsp">Product View</a></li>
						<li class="nav-item"><a class="nav-link" href="adminUsersView.jsp">User View</a></li>
						<li class="nav-item"><a class="nav-link" href="adminOrderView.jsp">Oder View</a></li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a></li>
				<%
				} else {
				%>
				<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
			
				<%
				}
				%>
			</ul>
		</div>
	</div>
</nav>