<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Admin Dash</title>
<!-- plugins:css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/feather/feather.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/ti-icons/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/typicons/typicons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/simple-line-icons/css/simple-line-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/vendors/datatables.net-bs4/dataTables.bootstrap4.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/js/select.dataTables.min.css">
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/vertical-layout-light/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" />
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
						src="${pageContext.request.contextPath}/images/logo.svg" alt="logo" />
					</a> <a class="navbar-brand brand-logo-mini" href="dashboard.jsp">
						<img src="${pageContext.request.contextPath}/images/logo-mini.svg" alt="logo" />
					</a>
				</div>
			</div>
			<div class="navbar-menu-wrapper d-flex align-items-top">
				<ul class="navbar-nav">
					<li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
						<h1 class="welcome-text">
							Good Morning, <span class="text-black fw-bold">${username}</span>
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
							class="img-xs rounded-circle" src="${pageContext.request.contextPath}/images/faces/face8.jpg"
							alt="Profile image">
					</a>
						<div class="dropdown-menu dropdown-menu-right navbar-dropdown"
							aria-labelledby="UserDropdown">
							<div class="dropdown-header text-center">
								<img class="img-md rounded-circle"
									src="${pageContext.request.contextPath}/images/faces/face8.jpg" alt="Profile image">
								<p class="mb-1 mt-3 font-weight-semibold">
									<c:out value="${username}"/>
								</p>
								<p class="fw-light text-muted mb-0"><c:out value="${email }"></c:out></p>
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
						data-bs-toggle="collapse" href="createAgentForm.jsp"
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
								<div
									class="d-sm-flex align-items-center justify-content-between border-bottom">
									<ul class="nav nav-tabs" role="tablist">
										<li class="nav-item"><a class="nav-link active ps-0"
											id="home-tab" data-bs-toggle="tab" href="#overview"
											role="tab" aria-controls="overview" aria-selected="true">Admins</a>
										</li>
										<li class="nav-item"><a class="nav-link" id="profile-tab"
											data-bs-toggle="tab" href="#audiences" role="tab"
											aria-selected="false">Agents</a></li>
										<li class="nav-item"><a class="nav-link" id="contact-tab"
											data-bs-toggle="tab" href="#demographics" role="tab"
											aria-selected="false">Performance</a></li>
										<li class="nav-item"><a class="nav-link border-0"
											id="more-tab" data-bs-toggle="tab" href="#more" role="tab"
											aria-selected="false">More</a></li>
									</ul>
									<div>
										<div class="btn-wrapper">
											<a href="#" class="btn btn-otline-dark align-items-center"><i
												class="icon-share"></i> Share</a> <a href="#"
												class="btn btn-otline-dark"><i class="icon-printer"></i>
												Print</a> <a href="#" class="btn btn-primary text-white me-0"><i
												class="icon-download"></i> Export</a>
										</div>
									</div>
								</div>
								<div class="tab-content tab-content-basic">
									<div class="tab-pane fade show active" id="overview"
										role="tabpanel" aria-labelledby="overview">
										<div class="row">
											<div class="col-sm-12">
												<div
													class="statistics-details d-flex align-items-center justify-content-between">
													<div>
														<p class="statistics-title">Total Admins</p>
														<h3 class="rate-percentage">32.53%</h3>
														<p class="text-danger d-flex">
															<i class="mdi mdi-menu-down"></i><span>-0.5%</span>
														</p>
													</div>
													<div>
														<p class="statistics-title">Total Agents</p>
														<h3 class="rate-percentage">7,682</h3>
														<p class="text-success d-flex">
															<i class="mdi mdi-menu-up"></i><span>+0.1%</span>
														</p>
													</div>
													<div>
														<p class="statistics-title">Visitors</p>
														<h3 class="rate-percentage">68.8</h3>
														<p class="text-danger d-flex">
															<i class="mdi mdi-menu-down"></i><span>68.8</span>
														</p>
													</div>

												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-8 d-flex flex-column">
												<div class="row flex-grow">
													<div
														class="col-12 col-lg-4 col-lg-12 grid-margin stretch-card">
														<div class="card card-rounded">
															<div class="card-body">
																<div
																	class="d-sm-flex justify-content-between align-items-start">
																	<div>
																		<h4 class="card-title card-title-dash">Occupancy Rate</h4>
																		<h5 class="card-subtitle card-subtitle-dash">Overview of current room occupancy</h5>
																	</div>
																	<div id="occupancy-legend"></div>
																</div>
																<div class="chartjs-wrapper mt-5">
																	<canvas id="occupancyChart"></canvas>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="col-lg-4 d-flex flex-column">
												<div class="row flex-grow">
													<div class="col-md-6 col-lg-12 grid-margin stretch-card">
														<div class="card bg-primary card-rounded">
															<div class="card-body pb-0">
																<h4 class="card-title card-title-dash text-white mb-4">Revenue
																	Summary</h4>
																<div class="row">
																	<div class="col-sm-5">
																		<p class="status-summary-ight-white mb-1">Total Revenue</p>
																		<h2 class="text-info">$85,000</h2>
																	</div>
																	<div class="col-sm-8">
																		<div class="status-summary-chart-wrapper pb-4">
																			<canvas id="revenueSummary"></canvas>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-md-6 col-lg-12 grid-margin stretch-card">
														<div class="card card-rounded">
															<div class="card-body">
																<div class="row">
																	<div class="col-sm-6">
																		<div
																			class="d-flex justify-content-between align-items-center mb-2 mb-sm-0">
																			<div class="circle-progress-width">
																				<div id="totalVisitors"
																					class="progressbar-js-circle pr-2"></div>
																			</div>
																			<div>
																				<p class="text-small mb-2">Total Visitors</p>
																				<h4 class="mb-0 fw-bold">26.80%</h4>
																			</div>
																		</div>
																	</div>
																	<div class="col-sm-6">
																		<div
																			class="d-flex justify-content-between align-items-center">
																			<div class="circle-progress-width">
																				<div id="visitperday"
																					class="progressbar-js-circle pr-2"></div>
																			</div>
																			<div>
																				<p class="text-small mb-2">Visits per day</p>
																				<h4 class="mb-0 fw-bold">9065</h4>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-8 d-flex flex-column">
												<div class="row flex-grow">
													<div class="col-md-6 col-lg-12 grid-margin stretch-card">
														<div class="card card-rounded shadow-sm">
															<div class="card-body">
																<h4 class="card-title card-title-dash mb-4 text-primary">
																	<i class="bi bi-calendar-event"></i> Upcoming Bookings
																</h4>
																<div class="list-wrapper">
																	<ul class="list-group">
																		<li class="list-group-item d-flex">
																			<div class="col text-start">
																				<strong>John Doe</strong>
																			</div>
																			<div class="col text-center">
																				<small class="text-muted">Room 204</small>
																			</div>
																			<div class="col text-end">
																				<span class="badge bg-success"> <i
																					class="bi bi-check-circle"></i> 24 Nov 2024
																				</span>
																			</div>
																		</li>
																		<li class="list-group-item d-flex">
																			<div class="col text-start">
																				<strong>Jane Smith</strong>
																			</div>
																			<div class="col text-center">
																				<small class="text-muted">Room 305</small>
																			</div>
																			<div class="col text-end">
																				<span class="badge bg-warning"> <i
																					class="bi bi-exclamation-circle"></i> 25 Nov 2024
																				</span>
																			</div>
																		</li>
																		<li class="list-group-item d-flex">
																			<div class="col text-start">
																				<strong>David Wilson</strong>
																			</div>
																			<div class="col text-center">
																				<small class="text-muted">Suite 101</small>
																			</div>
																			<div class="col text-end">
																				<span class="badge bg-danger"> <i
																					class="bi bi-x-circle"></i> Pending
																				</span>
																			</div>
																		</li>
																	</ul>
																</div>
															</div>
														</div>


                                                        </div>
													</div>
													<div class="row flex-grow">
														<div class="col-12 grid-margin stretch-card">
															<div class="card card-rounded table-darkBGImg">
																<div class="card-body">
																	<div class="col-sm-8">
																		<h3 class="text-white upgrade-info mb-0">
																			Enhance your <span class="fw-bold">Promotions</span>
																			for better bookings
																		</h3>
																		<a href="#" class="btn btn-info upgrade-btn">Create
																			New Offer!</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="row flex-grow">
														<div class="col-12 grid-margin stretch-card">
															<div class="card card-rounded">
																<div class="card-body">
																	<div
																		class="d-sm-flex justify-content-between align-items-start">
																		<div>
																			<h4 class="card-title card-title-dash">Agents</h4>
																			<p class="card-subtitle card-subtitle-dash">You
																				have <c:out value="${agents.size()}"></c:out> agents</p>
																		</div>
																		<div>
																			<a 
																			    href="createAgentForm.jsp"
																				class="btn btn-primary btn-lg text-white mb-0 me-0"
																				>
																				<i class="mdi mdi-account-plus"></i>Add new agent
																			</a>
																		</div>
																	</div>
																	<div class="table-responsive  mt-1">
																		<table class="table select-table">
																			<thead>
																				<tr>
																					<th>
																						<div class="form-check form-check-flat mt-0">
																							<label class="form-check-label"> <input
																								type="checkbox" class="form-check-input"
																								aria-checked="false"><i
																								class="input-helper"></i></label>
																						</div>
																					</th>
																					<th>Agent ID</th>
																					<th>Username</th>
																					<th>Password</th>
																					<th>Email</th>
																					<th>Role</th>
																					<th>Actions</th>
																				</tr>
																			</thead>
																			<tbody>
																			  <c:forEach var="agent" items="${agents}">
																				<tr>
																					<td>
																<div class="form-check form-check-flat mt-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		aria-checked="false"><i class="input-helper"></i></label>
																</div>
															</td>
																					<td>
																						<div class="d-flex ">
																							<img src="${pageContext.request.contextPath}/images/faces/face${agent.id }.jpg" alt="">
																							<div>
																								<p>${agent.id}</p>
																							</div>
																						</div>
																					</td>
																					<td>
																						${agent.username}
																					</td>
																					<td>
																						${agent.password}
																					</td>
																					<td>
																					    ${agent.email}
																					</td>
																					<td> 
																					    ${agent.role}
																					</td>
																					<td>
																					  <div class="badge badge-opacity-warning"><a href="updateAgentForm.jsp?id=${agent.id}">Update</a></div>
																					  <form method="post" action="${pageContext.request.contextPath}/admin/dashboard">
																					     <input type="hidden" name="action" value="delete">
																					     <input type="hidden" name="id" value="${agent.id }">
																					     <button type="submit" class="badge badge-opacity-danger">Delete</button>
																					  </form>
																					</td>
																				</tr>
                                                                                </c:forEach>
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="col-lg-4 d-flex flex-column">
													<div class="row flex-grow">
														<div class="col-12 grid-margin stretch-card">
															<div class="card card-rounded">
																<div class="card-body">
																	<h4 class="card-title card-title-dash">Tasks</h4>
																	<ul class="list-group">
																		<li
																			class="list-group-item d-flex justify-content-between align-items-center">
																			Clean Room 204 <span class="badge bg-warning">Pending</span>
																		</li>
																		<li
																			class="list-group-item d-flex justify-content-between align-items-center">
																			Check plumbing in Suite 101 <span
																			class="badge bg-danger">Urgent</span>
																		</li>
																		<li
																			class="list-group-item d-flex justify-content-between align-items-center">
																			Prepare welcome kit for Room 305 <span
																			class="badge bg-success">Completed</span>
																		</li>
																	</ul>
																</div>
															</div>
														</div>
														<div class="row flex-grow">
															<div class="col-12 grid-margin stretch-card">
																<div class="card card-rounded">
																	<div class="card-body">
																		<div class="row">
																			<div class="col-lg-12">
																				<div
																					class="d-flex justify-content-between align-items-center mb-3">
																					<h4 class="card-title card-title-dash">Type By
																						Amount</h4>
																				</div>
																				<canvas class="my-auto" id="doughnutChart"
																					height="200"></canvas>
																				<div id="doughnut-chart-legend"
																					class="mt-5 text-center"></div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<div class="row flex-grow">
															<div class="col-12 grid-margin stretch-card">
																<div class="card card-rounded">
																	<div class="card-body">
																		<div class="row">
																			<div class="col-lg-12">
																				<div
																					class="d-flex justify-content-between align-items-center mb-3">
																					<div>
																						<h4 class="card-title card-title-dash">Leave
																							Report</h4>
																					</div>
																					<div>
																						<div class="dropdown">
																							<button
																								class="btn btn-secondary dropdown-toggle toggle-dark btn-lg mb-0 me-0"
																								type="button" id="dropdownMenuButton3"
																								data-bs-toggle="dropdown" aria-haspopup="true"
																								aria-expanded="false">Month Wise</button>
																							<div class="dropdown-menu"
																								aria-labelledby="dropdownMenuButton3">
																								<h6 class="dropdown-header">week Wise</h6>
																								<a class="dropdown-item" href="#">Year Wise</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<div class="mt-3">
																					<canvas id="leaveReport"></canvas>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>

													</div>
												</div>
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
			</div>

			<!-- plugins:js -->
			<script src="${pageContext.request.contextPath}/vendors/js/vendor.bundle.base.js"></script>
			<!-- endinject -->
			<!-- Plugin js for this page -->
			<script src="${pageContext.request.contextPath}/vendors/chart.js/Chart.min.js"></script>
			<script
				src="${pageContext.request.contextPath}/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
			<script src="${pageContext.request.contextPath}/vendors/progressbar.js/progressbar.min.js"></script>

			<!-- End plugin js for this page -->
			<!-- inject:js -->
			<script src="${pageContext.request.contextPath}/js/off-canvas.js"></script>
			<script src="${pageContext.request.contextPath}/js/hoverable-collapse.js"></script>
			<script src="${pageContext.request.contextPath}/js/template.js"></script>
			<script src="${pageContext.request.contextPath}/js/settings.js"></script>
			<script src="${pageContext.request.contextPath}/js/todolist.js"></script>
			<!-- endinject -->
			<!-- Custom js for this page-->
			<script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
			<script src="${pageContext.request.contextPath}/js/Chart.roundedBarCharts.js"></script>
			<!-- End custom js for this page-->
</body>

</html>

