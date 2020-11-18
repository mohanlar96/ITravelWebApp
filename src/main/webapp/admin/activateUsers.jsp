<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Admin | User Requests</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- DATA TABLES -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css" />
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>    
  </head>
  <body class="skin-blue">
    <div class="wrapper">      
      <header class="main-header">
        <a href="controlWords" class="logo"><b>Admin</b>Panel</a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">              
              
              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <img src="img/user2-160x160.jpg" class="user-image" alt="User Image"/>
                  <span class="hidden-xs">Admin</span>
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="img/user2-160x160.jpg" class="img-circle" alt="User Image" />
                    <p>
                      Team FullStack                      
                    </p>
                  </li>                  
                  <!-- Menu Footer-->
                  <li class="user-footer">
                      <div class="pull-right">
                          <a href="logout" class="btn btn-default btn-flat">Sign out</a>
                      </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">                    
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header">MAIN NAVIGATION</li>                        
            <li>
              <a href="deactivatedUsers" class="current">
                <i class="fa fa-th"></i> <span>Deactivated Users</span> <span class="badge" id="badgeDeactivatedUsers">${TOTAL_USER_CNT}</span>
              </a>
            </li> 
            <li>
              <a href="bannedPosts">
                <i class="fa fa-th"></i> <span>Banned Posts</span> <span class="badge" id="badgeBannedPost"></span>
              </a>
            </li>
            <li>
              <a href="controlWords">
                <i class="fa fa-th"></i> <span>Control Words</span>
              </a>
            </li>                               
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Right side column. Contains the navbar and content of the page -->
      <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">List of deactivated users</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <div>
                    <button type="button" id="activateBtn" class="btn btn-success">Activate</button>
                  </div>
                  <table id="example2" class="table table-bordered table-hover">
                    <thead>
                      <tr>
                        <th>#ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="tempUser" items="${USER_LIST}">
                      <tr>
                        <td> ${tempUser.id} </td>
                        <td> ${tempUser.firstName} </td>
                        <td> ${tempUser.lastName} </td>
                        <td> ${tempUser.email} </td>
                        <td><input type="checkbox" name="name1"></td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                  <div class="row">
                    <div class="col-xs-6">
                      <div id="mytable_info">
                        <p data-page="${PAGE}" data-totalpage="${TOTAL_LENGTH}"
                           id="myPagination">${PAGE} of ${TOTAL_LENGTH}</p>
                      </div>
                    </div>
                    <div class="col-xs-6">
                      <nav aria-label="CustomPagination">
                        <ul class="pagination">
                          <%--                        <c:set var = "currPage" scope="session" value="${PAGE}"/>--%>
                          <%--                        <c:set var = "totalPage" scope="session" value="${TOTAL_LENGTH}"/>--%>
                          <li class="page-item"><a class="page-link" <c:if
                                  test="${PAGE>1}"> href="deactivatedUsers?cmdUserServlet=LIST&page=${PAGE-1}"
                          </c:if> >Previous</a></li>
                          <c:forEach var="i" begin="1" end="${TOTAL_LENGTH}">
                            <%--                        Item <c:out value = "${i}"/><p>--%>
                            <li class="page-item"><a class="page-link"
                                                     href="deactivatedUsers?cmdUserServlet=LIST&page=${i}">${i}</a>
                            </li>
                          </c:forEach>
                          <%--                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
                          <%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                          <%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                          <li class="page-item"><a class="page-link" <c:if
                                  test="${PAGE<TOTAL_LENGTH}"> href="deactivatedUsers?cmdUserServlet=LIST&page=${PAGE+1}"
                          </c:if>>Next</a></li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div><!-- /.box-body -->
              </div><!-- /.box -->              
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <footer class="main-footer">
        <div class="pull-right hidden-xs">
          <b>Version</b> 1.0
        </div>
        Full Stack Team
      </footer>
    </div><!-- ./wrapper -->

    <!-- jQuery 2.1.3 -->
    <script src="js/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="js/jquery.dataTables.js" type="text/javascript"></script>
    <script src="js/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- SlimScroll -->
    <script src="js/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='js/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="js/app.min.js" type="text/javascript"></script>
    <!-- AdminLTE for demo purposes -->
    <!-- <script src="../../dist/js/demo.js" type="text/javascript"></script> -->
    <%-- <!-- page script -->
    <script type="text/javascript">
      $(function () {        
        $('#example2').dataTable({
          "bPaginate": true,
          "bLengthChange": false,
          "bFilter": false,
          "bSort": true,
          "bInfo": true,
          "bAutoWidth": false
        });
      });
    </script> --%>
    <script src='js/myCustomJs/myUtil.js'></script>
    <script src='js/myCustomJs/deactivatedUsers.js'></script>

  </body>
</html>
