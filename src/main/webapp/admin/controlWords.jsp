<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin | Control Words</title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- Bootstrap 3.3.2 -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css"/>
    <!-- DATA TABLES -->
    <link href="css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
    <!-- Theme style -->
    <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css"/>
    <!-- AdminLTE Skins. Choose a skin from the css/skins
           folder instead of downloading all of them to reduce the load. -->
    <link href="css/_all-skins.min.css" rel="stylesheet" type="text/css"/>
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
                                <img src="img/user2-160x160.jpg" class="img-circle" alt="User Image"/>
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
                    <a href="deactivatedUsers">
                        <i class="fa fa-th"></i> <span>Deactivated Users</span> <span class="badge" id="badgeDeactivatedUsers"></span>
                    </a>
                </li>
                <li>
                    <a href="bannedPosts">
                        <i class="fa fa-th"></i> <span>Banned Posts</span> <span class="badge" id="badgeBannedPost"></span>
                    </a>
                </li>
                <li>
                    <a href="controlWords" class="current">
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
                            <h3 class="box-title">Control Words</h3>
                        </div><!-- /.box-header -->
                        <div class="box-body">
                            <div>
                                <button type="button" class="btn btn-success" id="addWordBtn" data-toggle="modal"
                                        data-target="#addModal">Add+
                                </button>
                            </div>
                            <table id="example2" class="table table-bordered table-hover">
                                <thead>
                                <tr>
                                    <th>#ID</th>
                                    <th>Word</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="tempWord" items="${WORD_LIST}">
                                    <tr>
                                        <td> ${tempWord.id} </td>
                                        <td> ${tempWord.theWord} </td>
                                        <td>
                                            <div>
                                                <button type="button" class="btn btn-success edit" data-toggle="modal"
                                                        data-target="#editModal">Edit
                                                </button>
                                                <button type="button" class="btn btn-danger delete" data-toggle="modal"
                                                        data-target="#deleteModal">Delete
                                                </button>
                                            </div>
                                        </td>
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
                                                    test="${PAGE>1}"> href="controlWords?cmdWordServlet=LIST&page=${PAGE-1}"
                                            </c:if> >Previous</a></li>
                                            <c:forEach var="i" begin="1" end="${TOTAL_LENGTH}">
                                                <%--                        Item <c:out value = "${i}"/><p>--%>
                                                <li class="page-item"><a class="page-link"
                                                                         href="controlWords?cmdWordServlet=LIST&page=${i}">${i}</a>
                                                </li>
                                            </c:forEach>
                                            <%--                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
                                            <%--                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
                                            <%--                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
                                            <li class="page-item"><a class="page-link" <c:if
                                                    test="${PAGE<TOTAL_LENGTH}"> href="controlWords?cmdWordServlet=LIST&page=${PAGE+1}"
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

<%--  3 Modals are used. [Add, Delete, Edit]--%>
<%--  Each submission will cause ajax call "GET" request to servlet--%>
<!-- my modal Add Word -->
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel1" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="ModalLabel1">Add Word</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/TestServlet?page=1" method="GET" id="ModalForm1">
                    <input type="hidden" id="cmdWordServlet" value="ADD">
                    <div class="form-group">
                        <label for="showWordId1">Id</label>
                        <input type="text" name="showWordId1" class="form-control" id="showWordId1" readonly>
                    </div>
                    <div class="form-group">
                        <label for="addModalVarWord">Word</label>
                        <input type="text" name="addModalVarWord" class="form-control" id="addModalVarWord"
                               placeholder="word to ban"
                               required>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-secondary" data-dismiss="modal">Close</a>
                        <button type="button" id="saveModalButton1" class="btn btn-primary" data-dismiss="modal">Add
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- my modal Edit Word -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="ModalLabel2">Edit Word</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="POST" id="ModalForm2">
                    <input type="hidden" id="wordCmdEdit" value="update">
                    <div class="form-group">
                        <label for="showWordId2">Id</label>
                        <input type="text" name="showWordId2" class="form-control" id="showWordId2" readonly>
                    </div>
                    <div class="form-group">
                        <label for="editWord2">Word</label>
                        <input type="text" name="editWord2" class="form-control" id="editWord2"
                               placeholder="word to ban"
                               required>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-secondary" data-dismiss="modal">Close</a>
                        <button type="button" id="editModalButton2" class="btn btn-primary" data-dismiss="modal">Save
                            changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%-- my modal Delete Word--%>
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="deleteModalLabel">Delete Word</h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="" method="POST" id="ModalForm3">
                    <div class="form-group">
                        <label for="showWordId3">Id</label>
                        <input type="text" name="showWordId3" class="form-control" id="showWordId3" readonly>
                    </div>
                    <div class="form-group">
                        <label for="deleteWord3">Word</label>
                        <input type="text" name="editWord2" class="form-control" id="deleteWord3"
                               placeholder="word to ban"
                               required>
                    </div>
                    <div class="modal-footer">
                        <a class="btn btn-secondary" data-dismiss="modal">Close</a>
                        <button type="button" id="deleteModalButton3" class="btn btn-primary" data-dismiss="modal">
                            Delete
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

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
<!-- page script -->
<%--  <script type="text/javascript">--%>
<%--    $(function () {--%>
<%--      $('#example2').dataTable({--%>
<%--        "bPaginate": true,--%>
<%--        "bLengthChange": false,--%>
<%--        "bFilter": false,--%>
<%--        "bSort": true,--%>
<%--        "bInfo": true,--%>
<%--        "bAutoWidth": false--%>
<%--      });--%>
<%--    });--%>
<%--  </script>--%>
<script src='js/myCustomJs/myUtil.js'></script>
<script src='js/myCustomJs/controlWords.js'></script>
</body>

</html>