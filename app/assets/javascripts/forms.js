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
		var elements = []
		$('.dropped').each(function(index){
			var object = $(this);
			var position = object.offset()
			var top = position.top;
			var left = position.left;
			var width = object.width();
			var height = object.height();
			//alert('top:'+top+" / left:"+left + "/ width:" +width+"/ height:"+height);
			var element = {'top':top,'left':left,'width':width,'height':height};
			elements.push(element);
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