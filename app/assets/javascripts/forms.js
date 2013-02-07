$(document).ready(function(){
	
	$('.draggable').draggable({
		revert: 'invalid',
		containment: '#canvas_content'
	});

	$('.resizable').resizable();
		
	$('#droppable').droppable({
    	accept: function(el) {
        	return el.hasClass('draggable');
        },
        drop: function(event,ui){
        	$(ui.draggable).addClass('dropped');
        }
    });
	
	$('#save').click(function(event){
		event.preventDefault();
		var elements = {"fields":[]}
		var counter = 0;
		$('.dropped').each(function(index){
			var object = $(this);
			var position = object.offset()
			var top = position.top;
			var left = position.left;
			var width = object.width();
			var height = object.height();
			var field_id = object.attr('field_id');
			var element = {'field_id':field_id,'axis_y':top,'axis_x':left,'width':width,'height':height};
			elements.fields.push(element);
		});
		$.ajax({
            type: 'POST',
            dataType : 'json',
            url: "/position",
            data: elements,
            error: function(request,error){ alert(request.responseText)  },
            success: function(data){
            	alert('success');
            },
            complete: function(){
            	//$('#payment_button').fadeIn();
            }
            });
	});

    var url = '/assets/banorte.pdf';
    PDFJS.disableWorker = true;
    PDFJS.getDocument(url).then(function getPdfHelloWorld(pdf) {
      pdf.getPage(1).then(function getPageHelloWorld(page) {
        var scale = 1;
        var viewport = page.getViewport(scale);
        var canvas = document.getElementById('the-canvas');
        var context = canvas.getContext('2d');
        canvas.height = viewport.height;
        canvas.width = viewport.width;
        page.render({canvasContext: context, viewport: viewport});
      });
    });
});