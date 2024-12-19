<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Agent Dash</title>
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
							Good Morning, <span class="text-black fw-bold"><c:out value="${username}"></c:out></span>
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
									<c>${username}</c>
								</p>
								<p class="fw-light text-muted mb-0"><c:out value="${username }"></c:out></p>
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
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="dashboard.jsp">
							<i class="mdi mdi-grid-large menu-icon"></i> <span
							class="menu-title">Dashboard</span>
					</a></li>
					<li class="nav-item nav-category">Hotels</li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
						aria-controls="ui-basic"> <i
							class="menu-icon mdi mdi-floor-plan"></i> <span
							class="menu-title">View Hotels</span> <i class="menu-arrow"></i>
					</a></li>
					<li class="nav-item nav-category">Manage Hotels</li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="createHotelForm.jsp"
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Add an Hotel</span> <i
							class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href=""
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Update an Hotel Infos</span> <i
							class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href=""
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Delete an Hotel</span> <i
							class="menu-arrow"></i>
					</a></li>
					
					<li class="nav-item nav-category">Manage Rooms</li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href="createRoomForm.jsp"
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Add a Room</span> <i
							class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href=""
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Update a Room Infos</span> <i
							class="menu-arrow"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						data-bs-toggle="collapse" href=""
						aria-expanded="false" aria-controls="form-elements"> <i
							class="menu-icon mdi mdi-card-text-outline"></i> <span
							class="menu-title">Delete a Room</span> <i
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

			<div class="main-panel">
				<div class="content-wrapper">
<!-- 				    <div class="container"> -->
            <div class="row searchFilter my-4">
                <div class="col-md-12">
                    <form action="${pageContext.request.contextPath}/agent/dashboard" method="get" class="d-flex align-items-center gap-2">
                        <input type="text" name="filterName" placeholder="Search by name" class="form-control" value="${param.filterName}">
                        <input type="text" name="filterCity" placeholder="Search by city" class="form-control" value="${param.filterCity}">
                        <select name="filterStars" class="form-select">
                            <option value="">All Stars</option>
                            <option value="1" ${param.filterStars == '1' ? 'selected' : ''}>1 Star</option>
                            <option value="2" ${param.filterStars == '2' ? 'selected' : ''}>2 Stars</option>
                            <option value="3" ${param.filterStars == '3' ? 'selected' : ''}>3 Stars</option>
                            <option value="4" ${param.filterStars == '4' ? 'selected' : ''}>4 Stars</option>
                            <option value="5" ${param.filterStars == '5' ? 'selected' : ''}>5 Stars</option>
                        </select>
                        <button type="submit" class="btn btn-primary"><i class="mdi mdi-filter"></i>Filter</button>
                    </form>
                </div>
            </div>
<!--         </div> -->
					<div class="row">
						<div class="col-sm-12">
                            

							<div class="row flex-grow">
								<div class="col-12 grid-margin stretch-card">
									<div class="card card-rounded">
										<div class="card-body">
											<div
												class="d-sm-flex justify-content-between align-items-start">
												<div>
													<h4 class="card-title card-title-dash">Hotels</h4>
													<p class="card-subtitle card-subtitle-dash">You have
														<c:out value="${hotels.size()}"></c:out> hotels</p>
												</div>
												<div>
													<a href="createHotelForm.jsp"
													    class="btn btn-primary btn-lg text-white mb-0 me-0"
														><i class="mdi mdi-account-plus"></i>Add new Hotel
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
																		aria-checked="false"><i class="input-helper"></i></label>
																</div>
															</th>
															<th>Hotel ID</th>
															<th>Name</th>
															<th>City</th>
															<th>Stars</th>
															<th>Description</th>
															<th>Image</th>
															<th>Actions</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="hotel" items="${hotels}">
														<tr>
														  
															<td>
																<div class="form-check form-check-flat mt-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		aria-checked="false"><i class="input-helper"></i></label>
																</div>
															</td>
															<td>
																${hotel.id}
															</td>
															<td>
																${hotel.name }
															</td>
															<td>
																${hotel.city }
															</td>
															<td>
															    ${hotel.stars}
															</td>
															<td>
															    ${hotel.description }
															</td>
															<td>
															    <div class="d-flex ">
																	<img src="${hotel.image}" alt="" class="img-thumbnail" style="width: 100px; height: auto;">
																</div>
															</td>
															<td>
																					  <div class="badge badge-opacity-warning"><a href="updateHotelForm.jsp?id=${hotel.id}">Update</a></div>
																					  <form method="post" action="${pageContext.request.contextPath}/agent/dashboard">
																					     <input type="hidden" name="action" value="deleteHotel">
																					     <input type="hidden" name="id" value="${hotel.id }">
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
							
							<div class="row flex-grow">
								<div class="col-12 grid-margin stretch-card">
									<div class="card card-rounded">
										<div class="card-body">
											<div
												class="d-sm-flex justify-content-between align-items-start">
												<div>
													<h4 class="card-title card-title-dash">Rooms</h4>
													<p class="card-subtitle card-subtitle-dash">You have
														${rooms.size() } rooms</p>
												</div>
												<div>
													<a href="createRoomForm.jsp" class="btn btn-primary btn-lg text-white mb-0 me-0"
														><i class="mdi mdi-account-plus"></i>Add new Room
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
																		aria-checked="false"><i class="input-helper"></i></label>
																</div>
															</th>
															<th>Room ID</th>
															<th>Label</th>
															<th>Capacity</th>
															<th>Price</th>
															<th>Hotel ID</th>
															<th>Actions</th>
														</tr>
													</thead>
													<tbody>
													<c:forEach var="room" items="${ rooms}">
														<tr>
														
															<td>
																<div class="form-check form-check-flat mt-0">
																	<label class="form-check-label"> <input
																		type="checkbox" class="form-check-input"
																		aria-checked="false"><i class="input-helper"></i></label>
																</div>
															</td>
															<td>
																${room.id }
															</td>
															<td>
																${room.label }
															</td>
															<td>
																${room.capacity }
															</td>
															<td>
															    ${room.price }
															</td>
															<td>
															    ${room.hotelId }
															</td>
															<td>
																					  <div class="badge badge-opacity-warning"><a href="updateRoomForm.jsp?id=${room.id}">Update</a></div>
																					  <form method="post" action="${pageContext.request.contextPath}/agent/dashboard">
																					     <input type="hidden" name="action" value="deleteRoom">
																					     <input type="hidden" name="id" value="${room.id }">
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
					</div>
					<footer class="footer">
						<div
							class="d-sm-flex justify-content-center justify-content-sm-between">
							<span
								class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Copyright
								© 2024. All rights reserved.</span>
						</div>
					</footer>
				</div>
			</div>
		</div>
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

	</div>
</body>
</html>