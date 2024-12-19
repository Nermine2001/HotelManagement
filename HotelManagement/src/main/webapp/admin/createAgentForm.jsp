<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Dash</title>
<!-- plugins:css -->
<link rel="stylesheet" href="../vendors/feather/feather.css">
<link rel="stylesheet"
	href="../vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="../vendors/typicons/typicons.css">
<link rel="stylesheet"
	href="../vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="../vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="../vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="../js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="../css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="../images/favicon.png" />
</head>
<body>
	<div class="container-scroller">
		<!-- partial:partials/_navbar.jsp -->
		<nav
			class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
			<div
				class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
				<div class="me-3">
					<button class="navbar-toggler navbar-toggler align-self-center"
						type="button" data-bs-toggle="minimize">
						<span class="icon-menu"></span>
					</button>
				</div>
				<div>
					<a class="navbar-brand brand-logo" href="dashboard.jsp"> <img
						src="../images/logo.svg" alt="logo" />
					</a> <a class="navbar-brand brand-logo-mini" href="dashboard.jsp">
						<img src="../images/logo-mini.svg" alt="logo" />
					</a>
				</div>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-top">
				<ul class="navbar-nav">
					<li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
						<h1 class="welcome-text">
							Good Morning, <span class="text-black fw-bold"><c>${username}</c></span>
						</h1>
						<h3 class="welcome-sub-text">Your performance summary</h3>
					</li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item d-none d-lg-block">
						<div id="datepicker-popup"
							class="input-group date datepicker navbar-date-picker">
							<span class="input-group-addon input-group-prepend border-right">
								<span class="icon-calendar input-group-text calendar-icon"></span>
							</span> <input type="text" class="form-control">
						</div>
					</li>
					<li class="nav-item">
						<form class="search-form" action="#">
							<i class="icon-search"></i> <input type="search"
								class="form-control" placeholder="Search Here"
								title="Search here">
						</form>
					</li>

					<li class="nav-item dropdown"><a
						class="nav-link count-indicator" id="countDropdown" href="#"
						data-bs-toggle="dropdown" aria-expanded="false"> <i
							class="icon-bell"></i> <span class="count"></span>
					</a>
						<div
							class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
							aria-labelledby="countDropdown">
							<a class="dropdown-item py-3">
								<p class="mb-0 font-weight-medium float-left">You have 7
									unread mails</p> <span
								class="badge badge-pill badge-primary float-right">View
									all</span>
							</a>
							<div class="dropdown-divider"></div>
						</div></li>
					<li class="nav-item dropdown d-none d-lg-block user-dropdown">
						<a class="nav-link" id="UserDropdown" href="#"
						data-bs-toggle="dropdown" aria-expanded="false"> <img
							class="img-xs rounded-circle" src="../images/faces/face8.jpg"
							alt="Profile image">
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="UserDropdown">
							<div class="dropdown-header text-center">
								<img class="img-md rounded-circle"
									src="../images/faces/face8.jpg" alt="Profile image">
								<p class="mb-1 mt-3 font-weight-semibold">
									<c>${username}</c>
								</p>
								<p class="fw-light text-muted mb-0">allenmoreno@gmail.com</p>
							</div>
							<a class="dropdown-item"><i
								class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i>
								My Profile </a> <a class="dropdown-item"><i
								class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i>
								Messages</a> <a class="dropdown-item"><i
								class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>
								Activity</a> <a class="dropdown-item"><i
								class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i>
								FAQ</a> <a class="dropdown-item"><i
								class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign
								Out</a>
						</div>
					</li>
				</ul>
				<button
					class="navbar-toggler navbar-toggler-right d-lg-none align-self-center"
					type="button" data-bs-toggle="offcanvas">
					<span class="mdi mdi-menu"></span>
				</button>
			</div>
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper">
			<!-- partial:partials/_settings-panel.jsp -->
			<div class="theme-setting-wrapper">
				<div id="settings-trigger">
					<i class="ti-settings"></i>
				</div>
				<div id="theme-settings" class="settings-panel">
					<i class="settings-close ti-close"></i>
					<p class="settings-heading">SIDEBAR SKINS</p>
					<div class="sidebar-bg-options selected" id="sidebar-light-theme">
						<div class="img-ss rounded-circle bg-light border me-3"></div>
						Light
					</div>
					<div class="sidebar-bg-options" id="sidebar-dark-theme">
						<div class="img-ss rounded-circle bg-dark border me-3"></div>
						Dark
					</div>
					<p class="settings-heading mt-2">HEADER SKINS</p>
					<div class="color-tiles mx-0 px-4">
						<div class="tiles success"></div>
						<div class="tiles warning"></div>
						<div class="tiles danger"></div>
						<div class="tiles info"></div>
						<div class="tiles dark"></div>
						<div class="tiles default"></div>
					</div>
				</div>
			</div>

			<!-- partial -->
			<!-- partial:partials/_sidebar.jsp -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="dashboard.jsp">
							<i class="mdi mdi-grid-large menu-icon"></i> <span
							class="menu-title">Dashboard</span>
					</a></li>
					<li class="nav-item nav-category">Accounts</li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i
							class="menu-icon mdi mdi-floor-plan"></i> <span
							class="menu-title">Agent Accounts</span> <i class="menu-arrow"></i>
					</a></li>
					<li class="nav-item nav-category">Create</li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="#form-elements"
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Create Agent Account</span> <i
							class="menu-arrow"></i>
					</a></li>
					<li class="nav-item nav-category">help</li>
					<li class="nav-item"><a class="nav-link"
						href="http://bootstrapdash.com/demo/star-admin2-free/docs/documentation.jsp">
							<i class="menu-icon mdi mdi-file-document"></i> <span
							class="menu-title">Documentation</span>
					</a></li>
				</ul>
			</nav>
			<!-- partial -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="row">
						<div class="col-sm-12">
							<div class="home-tab">
								<div class="container mt-5">
									<div
										class="row d-flex justify-content-center align-items-center">
										<div class="col-md-8">
											<form method="post" action="../admin/dashboard">
												<div class="form-row">
														<input type="hidden" name="action" class="form-control" value="create">
													
													<div class="form-group mb-3 col-md-6">
														<label for="username">Username</label> <input type="text"
															name="username" class="form-control" id="username"
															placeholder="Username">
													</div>
													<div class="form-group mb-3 col-md-6">
														<label for="password">Password</label> <input
															type="password" name="password" class="form-control"
															id="password" placeholder="Password">
													</div>
												</div>
												<div class="form-group mb-3 col-md-6">
													<label for="email">Email</label> <input type="email"
														name="email" class="form-control" id="email"
														placeholder="name@example.com">
												</div>

												<div class="form-group mb-4">
													<div class="form-check">
														<input class="form-check-input" type="checkbox"
															id="gridCheck"> <label class="form-check-label"
															for="gridCheck"> Check me out </label>
													</div>
												</div>
												<button type="submit" class="btn btn-primary">Create Agent</button>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- content-wrapper ends -->
					<!-- partial:partials/_footer.jsp -->
					<footer class="footer">
						<div
							class="d-sm-flex justify-content-center justify-content-sm-between">
							<span
								class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright
								© 2024. All rights reserved.</span>
						</div>
					</footer>
					<!-- partial -->
				</div>
				<!-- main-panel ends -->
			</div>
			<!-- page-body-wrapper ends -->
		</div>
		<!-- container-scroller -->

		<!-- plugins:js -->
		<script src="../vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<script src="../vendors/chart.js/Chart.min.js"></script>
		<script
			src="../vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="../vendors/progressbar.js/progressbar.min.js"></script>

		<!-- End plugin js for this page -->
		<!-- inject:js -->
		<script src="../js/off-canvas.js"></script>
		<script src="../js/hoverable-collapse.js"></script>
		<script src="../js/template.js"></script>
		<script src="../js/settings.js"></script>
		<script src="../js/todolist.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page-->
		<script src="../js/dashboard.js"></script>
		<script src="../js/Chart.roundedBarCharts.js"></script>
		<!-- End custom js for this page-->
</body>

</html>

