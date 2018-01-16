<%@ include file="../common/header_top.jsp" %>

<spring:url value="/resources/core/css/rotating-card.css" var="rotatingCss" />
<link href="${rotatingCss}" rel="stylesheet" />

<spring:url value="/resources/core/css/font-awesome.min.css" var="fontAwesomeCss" />
<link href="${fontAwesomeCss}" rel="stylesheet" />

<title>User Profile</title>

<%@ include file="../common/header_bottom.jsp" %>
    <div class="row">
        <div class="col-sm-12">
                <!-- Start card          -->
                <div class="card-container manual-flip">
                <div class="card">
                    <div class="front">
                        <div class="cover">
                          <spring:url value="/resources/core/images/rotating_card_thumb.png" var="imageUrl" />
                          <img src="${imageUrl}"/>
                        </div>
                        <div class="user">
                          <spring:url value="/resources/core/images/rotating_card_profile2.png" var="imageUrl" />
                          <img class="img-circle" src="${imageUrl}"/>
                        </div>
                        <div class="content">
                            <div class="main">
                                <h3 class="name">${ user.firstName } ${ user.lastName }</h3>
                                <p class="profession">${ locale.name }</p>
                                <sec:authorize access="isAuthenticated() and hasAnyRole( 
                                  'ROLE_LOCALE_TREASURER', 'ROLE_LOCALE_AUDITOR','ROLE_LOCALE_COORDINATOR', 'ROLE_GROUP_SERVANT',
                                  'ROLE_NATIONAL_COORDINATOR', 'ROLE_DISTRICT_COORDINATOR', 'ROLE_DISTRICT_SERVANT')">
                                  <p class="text-center">
                                  Preference
                                  </p>
                                  <!-- TODO: Edit user dashboard preference --> 
                                  <spring:url value="/user/${user.username}/profile" var="submitUrl" />
                                  <form:form method="POST" modelAttribute="user" action="${submitUrl}">
                                    <div class="row">
                                      <div class="col-sm-3 col-sm-offset-3 form-group" >
                                        <form:select path="preference.dashboard"
                                          class="form-control" placeholder="Member" style="width: 100%;" >
                                          <form:options items="${ dashboardTypes }" /> 
                                        </form:select>
                                      </div>
                                      <div class="col-sm-3">
                                         <input type="submit" value="Submit" class="btn btn-primary" style="width: 100%;" />
                                      </div>
                                    </div>
                                  </form:form>
                                  <!-- -->
                                </sec:authorize>

                            </div>
                            <div class="footer">
                              <!-- TODO: Temporary disable rotate 
                                <button class="btn btn-simple" onclick="rotateCard(this)">
                                    <i class="fa fa-mail-forward"></i> Manual Rotation
                                </button>
                              -->
                            </div>
                        </div>
                    </div> <!-- end front panel -->
                    <div class="back">
                        <div class="header">
                            <h5 class="motto">"To be or not to be, this is my awesome motto!"</h5>
                        </div>
                        <div class="content">
                            <div class="main">
                                <h4 class="text-center">Job Description</h4>
                                <p class="text-center">Web design, Adobe Photoshop, HTML5, CSS3, Corel and many others...</p>

                                <div class="stats-container">
                                    <div class="stats">
                                        <h4>235</h4>
                                        <p>
                                            Followers
                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4>114</h4>
                                        <p>
                                            Following
                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4>35</h4>
                                        <p>
                                            Projects
                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="footer">
                            <button class="btn btn-simple" rel="tooltip" title="Flip Card" onclick="rotateCard(this)">
                                <i class="fa fa-reply"></i> Back
                            </button>
                        </div>
                    </div> <!-- end back panel -->
                </div> <!-- end card -->
                </div> <!-- end card-container -->
                <!-- End Card -->
        </div>
    </div>
<script type="text/javascript">
    $().ready(function(){
        $('[rel="tooltip"]').tooltip();

    });

    function rotateCard(btn){
        var $card = $(btn).closest('.card-container');
        console.log($card);
        if($card.hasClass('hover')){
            $card.removeClass('hover');
        } else {
            $card.addClass('hover');
        }
    }
</script>
<%@ include file="../common/footer.jsp" %>