var minutes = 0;
var seconds = 0;

var displayTimer = function(id){
  $("#"+id).html(zeroPad(minutes,2)+':'+zeroPad(seconds,2));
  seconds += 1;
  if(seconds == 60){
    seconds = 0;
    minutes += 1;
  };
  if (minutes > 0 || seconds > 0) setTimeout('displayTimer("'+id+'")',1000);
  else setTimeout(do_function,1000);
};

var setTimer = function(id,min,sec){
  minutes = min;
  seconds = sec;
  displayTimer(id);
};

function zeroPad(num,count){
  var num = num+'';
  while(num.length < count){num = "0"+num;}
  return num;
};

var counter = 0;

function add_fields(link, association, content, length) {
  if(counter == 0) counter = length;
  var new_id = counter;
  counter++;
  var regexp = new RegExp("new_" + association, "g")
  $(link).before(content.replace(regexp, new_id));
}
