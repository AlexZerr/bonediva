
$.jRecorder ({
 
   'rec_width': '300',
   'rec_height': '200',
   'rec_top': '0px',
   'rec_left': '0px',
   'recorderlayout_id' : 'flashrecarea',
   'recorder_id' : 'audiorecorder',
   'recorder_name': 'audiorecorder',
   'wmode' : 'transparent',
   'bgcolor': '#ff0000',
   'swf_path': 'jRecorder.swf',
   'host': 'localhost:300/app/assets/acceptfile.rb?filename=hello.wav',
   'callback_started_recording' : function(){},
   'callback_finished_recording' : function(){},
   'callback_stopped_recording': function(){},
   'callback_error_recording' : function(){},
   'callback_activityTime': function(time){},
   'callback_activityLevel' : function(level){}
});
