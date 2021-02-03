<!DOCTYPE html>
<html>
<head>

    <title>O-Exam | Prepare Question</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="/img/titleImg.png" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" type="text/css" href="{{ url('/css/style.css') }}" />

    <style>
        body {
            background-image: url('/img/logoBackground.png');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }
    </style>

</head>

<body>

<!-- Links (sit on top) -->
<div class="w3-top">
    <div class="w3-padding w3-black" style="border-bottom: 2px solid #0750a3;">
        <a href = "{{ url('/') }}" target = "_self">
            <img src = "/img/logoClickable.jpg" border = "0" />
        </a>
        <a href="{{ url('/homepage_teacher') }}" class="w3-right w3-button">My Panel</a>

    </div>

    @if(session('error'))
        <div id="errorDIV" class="alert alert-danger alert-dismissible" style="width: 1918px;">
            {{ session('error')}}
        </div>

        <script>
            setTimeout(function() {
                $('#errorDIV').fadeOut('fast');
            }, 3750);
        </script>
    @endif

    @if(session('success'))
        <div id="successDIV" class="alert alert-success alert-dismissible" style="width: 1918px;">
            {{ session('success')}}
        </div>

        <script>
            setTimeout(function() {
                $('#successDIV').fadeOut('fast');
            }, 3750);
        </script>
    @endif

</div>

<nav class="navbar header-top fixed-top navbar-expand-lg" style="margin-top: 130px;">
    <ul class="navbar-nav ml-md-auto d-md-flex">
    <li class="nav-item">
        <a href="/teacher_courses/{{$courses->id}}" class="personalInfoLink" style="padding:7px 47.5px;">My Exams</a>
        <br><br>
        <a class="personalInfoLink" href="/teacher_courses/{{$courses->id}}/teacher_examsedit/{{$exam->id}}"
            style="background-color:#f44336; padding:7px 61.5px;">Cancel</a>
    </li>
    </ul>
</nav>

<form id="form1" action="/teacher_courses/{{$courses->id}}/teacher_examsedit/{{$exam->id}}/addexamquestionMC/{{$question[0]->id}}/examquestionMCedit" method="POST" class="form-horizontal">
    {{csrf_field()}}
    <div class="container3 register-form" style="margin-top: 112px">
        <div class="form">
            <div class="form-content" style="background-color: white; width:850px;">
                <h2 style="text-align:center;"><b>Prepare Question</b></h2><br>
                <h2 style="text-align:center;"><b>{{$courses->course_name}}</b></h2>
                <h2 style="text-align:center;"><b>{{$exam->name}}</b></h2>

                <div class="form-group">
                    <a href="/teacher_courses/{{$courses->id}}/teacher_examsedit/{{$exam->id}}/addexamquestionMC/{{$question[0]->id}}/examquestionMCedit/addexamquestoption" class="w3-right w3-button">Add Options to Question</a>
                    <label class="col-md-4 control-label"></label>
                <div class="col-md-8">
                    <br><br>

                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">
                            <label class="col-md-6 control-label" style="margin-left: 135px">Question Type</label>
                            <select style="width:200%; height:1.3cm; margin-left:135px;" class="form-control input-md" name="answer_type" id="qtype" disabled>
                                <option value="MultipleChoice">'<?php echo$question[0]->answer_type; ?>'</option>
                            </select>
                        </div>


                        <div class="form-group">
                            <label class="col-md-6 control-label" style="margin-left: 135px">Question</label>
                            <textarea name="question" style="height:190px; width:200%; resize:none; margin-left:135px;" type="text" class="form-control input-md"  required=""><?php echo$question[0]->question; ?></textarea>
                        </div>

                        <br><br>
                        <b><label class="col-md-6 control-label" style="margin-left: 135px">OPTIONS </label></b>

                        @foreach ($multiplechoiceanswer as $mca)
                            <div class="form-group" id ="ca">
                                <label class="col-md-6 control-label" style="margin-left: 135px;">Value & Answer</label>
                                <input name="value" id="correctanswer" type="text" class="form-control input-md" style="margin-left: 135px;width:200%;" value="{{$mca->value}}"  required="" readonly>
                                <input name="answer" id="correctanswer" type="text" class="form-control input-md" style="margin-left: 135px;width:200%;" value="{{$mca->answer}}" required="" readonly>
                               
                            </div>

                            <div class="form-group" style="width:500px">
                                <a href ="/teacher_courses/{{$courses->id}}/teacher_examsedit/{{$exam->id}}/addexamquestionT/{{$mca->question_id}}/examquestionMCedit/{{$mca->id}}/addexamquestoptionedit" class="editLink" style="margin-left: 280px;">Edit</a>&nbsp;
                                <a onclick="return confirm('Are you sure to delete this option?')" href="/teacher_courses/{{$courses->id}}/teacher_examsedit/{{$exam->id}}/addexamquestionMC/{{$mca->question_id}}/examquestionMCedit/{{$mca->id}}/deleteoption" class="deleteLink" id="delete" >Delete</a></td>
                            </div>

                            <br><br>


                        @endforeach
                        <div class="form-group" id ="ca">
                            <label class="col-md-6 control-label" style="margin-left: 135px">Correct Answer</label>
                            <input name="correct_answer" id="correctanswer" type="text" style="margin-left: 135px; width:200%" class="form-control input-md"  value='<?php echo$question[0]->correct_answer; ?>'required="">
                        </div>

                        <div class="form-group">
                            <label class="col-md-6 control-label" style="margin-left: 135px">Question Point</label>
                            <input name="evaluation_grade" id="evaluation_grade" type="number" style="margin-left: 135px; width:200%" class="form-control input-md"value='<?php echo$question[0]->evaluation_grade; ?>' required="" min="1">
                        </div>

                    </div>

                </div>
                <br>
                
                        @if($multiplechoiceanswerc ==1 )
                       
                        
                        <button style="margin-left:310px; width:2.5cm;" id="save"  class="btn btn-success">Save</button>
                        @else
                        <h4 style ="margin-left:200px;color:red;">"You must enter exactly one correct answer to save."</h4>

                        @endif
            
                    

                </div>
                </div>

            </div>
        </div>
    </div>
</form>

</body>
</html>


