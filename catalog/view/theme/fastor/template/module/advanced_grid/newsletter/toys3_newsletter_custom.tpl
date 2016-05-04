<!-- div class="newsletter toys3-newsletter clearfix row" id="newsletter<?php echo $id; ?>">
     <div class="inputs col-sm-4">
          <input type="text" class="email" placeholder="<?php echo $module['content']['input_placeholder']; ?>" />
          <a class="button btn-default subscribe"><?php echo $module['content']['subscribe_text']; ?></a>
     </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
	function Unsubscribe() {
		$.post('<?php echo $module['content']['unsubscribe_url']; ?>',
			{
				email: $('#newsletter<?php echo $id; ?> .email').val()
			}, function (e) {
				$('#newsletter<?php echo $id; ?> .email').val('');
				alert(e.message);
			}
		, 'json');
	}

	function Subscribe() {
		$.post('<?php echo $module['content']['subscribe_url']; ?>',
			{
				email: $('#newsletter<?php echo $id; ?> .email').val()
			}, function (e) {
				if(e.error === 1) {
					var r = confirm(e.message);
					if (r == true) {
					    $.post('<?php echo $module['content']['unsubscribe_url']; ?>', {
					    	email: $('#newsletter<?php echo $id; ?> .email').val()
					    }, function (e) {
					    	$('#newsletter<?php echo $id; ?> .email').val('');
					    	alert(e.message);
					    }, 'json');
					}
				} else {
					$('#newsletter<?php echo $id; ?> .email').val('');
					alert(e.message);
				}
			}
		, 'json');
	}

	$('#newsletter<?php echo $id; ?> .subscribe').click(Subscribe);
	$('#newsletter<?php echo $id; ?> .unsubscribe').click(Unsubscribe);
	$('#newsletter<?php echo $id; ?> .email').keypress(function (e) {
	    if (e.which == 13) {
	        Subscribe();
	    }
	});
});
</script -->