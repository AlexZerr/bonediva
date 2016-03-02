$(document).ready(function(){
    var index = 0;

    var mainImage = $("#mainImage").get(0);
    var mainSrc = mainImage.src;
    var images = $("[id=allImages]").get();
    console.log("Images:", images);
    if(mainImage && images.length > 0){
        $("#0").click(function(){
            if(index > 0){ 
                index--;
                mainImage.src = images[index].src;
            } 
        });

        $("#1").click(function(){
            if(index < images.length-1){
                index++;
                mainImage.src = images[index].src;
            }
        });
    }
});  
