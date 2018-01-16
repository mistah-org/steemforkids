    </div>
    <!-- /#container-fluid -->

    <nav class="navbar navbar-ct-blue navbar-fixed-bottom" role="navigation">
      <div class="container">
        <sec:authorize access="hasAnyRole('ROLE_LOCALE_TREASURER','ROLE_LOCALE_SECRETARY')">
          <ul class="nav nav-justified">
            <li class="navbar-nav">
              <spring:url value="/locale_account/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.locale}/collection/new" var="newUrl" />
              <a href="${ newUrl }">
                <i class="pe-7s-piggy" style="color: white;"></i>
              </a>
            </li>
            <!-- 
            <li class="navbar-nav">
              <spring:url value="/locale_account/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.locale}/collection/project/new" var="newUrl" />
              <a href="${ newUrl }">
                <i class="pe-7s-target" style="color: white;"></i>
              </a>
            </li>
             -->
            <li class="navbar-nav">
              <spring:url value="/locale_account/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.locale}/expense/new" var="newUrl" />
              <a href="${ newUrl }">
                <i class="pe-7s-cash" style="color: white;"></i>
              </a>
            </li>
          </ul>
        </sec:authorize>
        
        <sec:authorize access="hasAnyRole('ROLE_MEMBER')">
          <ul class="nav nav-justified">
            <li class="navbar-nav">
              <spring:url value="/locale_account/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.locale}/commitment/project" var="newUrl" />
              <a href="${ newUrl }">
                <i class="pe-7s-target" style="color: white;"></i>
              </a>
            </li>
          </ul>
        </sec:authorize>
        
        <sec:authorize access="hasAnyRole('ROLE_LOCALE_COORDINATOR')">
          <ul class="nav nav-justified">
            <li class="navbar-nav">
              <spring:url value="/locale_account/${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.user.locale}/project_book" var="newUrl" />
              <a href="${ newUrl }">
                <i class="pe-7s-target" style="color: white;"></i>
              </a>
            </li>
          </ul>
        </sec:authorize>
      </div><!-- /.container-fluid -->
    </nav>
    <!--  end navbar -->

</body>
</html>