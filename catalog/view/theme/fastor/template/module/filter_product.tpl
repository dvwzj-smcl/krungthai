<?php 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config');
$page_direction = $theme_options->get( 'page_direction' );
$class = 3; 
$id = rand(0, 5000)*rand(5000, 50000);
$all = $cols*$itemsperpage; 
$row = $itemsperpage; 

if($itemsperpage == 1) $class = 12;
if($itemsperpage == 2) $class = 6;
if($itemsperpage == 3) $class = 4;
if($itemsperpage == 4) $class = 3;
if($itemsperpage == 5) $class = 25;
if($itemsperpage == 6) $class = 2;

if(count($tabs) > 1 ) { ?>
<div class="filter-product">
	<div class="filter-tabs">
		<div class="bg-filter-tabs"><div class="bg-filter-tabs2 clearfix">
		<ul id="tab<?php echo $id; ?>">
			<?php $i = 0; foreach($tabs as $tab) {
				echo '<li'.($i == 0 ? ' class="active"' : '').'><a href="#'.$tab['title'].'-'.$id.'-'.$i.'">'.$tab['heading'].'</a></li>';
			$i++; } ?>
		</ul>
		</div></div>
	</div>
	
	<div class="tab-content clearfix">
		<?php $s = 0; foreach($tabs as $tab) { ?>
		<div class="tab-pane <?php if($s == 0) { echo 'active'; } ?>" id="<?php echo $tab['title'].'-'.$id.'-'.$s; ?>">
			<?php if($carousel != 0) { ?>
			<!-- Carousel nav -->
			<a class="next-button" href="#myCarousel<?php echo $id.'-'.$s; ?>" id="myCarousel<?php echo $id.'-'.$s; ?>_next"><span></span></a>
			<a class="prev-button" href="#myCarousel<?php echo $id.'-'.$s; ?>" id="myCarousel<?php echo $id.'-'.$s; ?>_prev"><span></span></a>
			<script type="text/javascript">
			$(document).ready(function() {
			  var owl<?php echo $id . '_' . $s; ?> = $(".filter-product #myCarousel<?php echo $id.'-'.$s; ?> .carousel-inner");
				
			  $("#myCarousel<?php echo $id.'-'.$s; ?>_next").click(function(){
			      owl<?php echo $id . '_' . $s; ?>.trigger('owl.next');
			      return false;
			    })
			  $("#myCarousel<?php echo $id.'-'.$s; ?>_prev").click(function(){
			      owl<?php echo $id . '_' . $s; ?>.trigger('owl.prev');
			      return false;
			  });
			    
			  owl<?php echo $id . '_' . $s; ?>.owlCarousel({
			  	  slideSpeed : 500,
			      singleItem:true,
			      <?php if($page_direction[$config->get( 'config_language_id' )] == 'RTL'): ?>
			      direction: 'rtl'
			      <?php endif; ?>
			   });
			});
			</script>
			<?php } ?>
			
			<div class="box-product">
				<div id="myCarousel<?php echo $id.'-'.$s; ?>" <?php if($carousel != 0) { ?>class="carousel slide"<?php } ?>>
					<!-- Carousel items -->
					<div class="carousel-inner">
						<?php $i = 0; $row_fluid = 0; foreach ($tab['products'] as $product) { $row_fluid++; ?>
			    			<?php if($i == 0) { echo '<div class="active item"><div class="product-grid"><div class="row">'; } ?>
			    			<?php $r=$row_fluid-floor($row_fluid/$all)*$all; if($row_fluid>$all && $r == 1) { echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; } else { $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } } ?>
			    			<div class="col-sm-<?php echo $class; ?> col-xs-6 <?php if($class == 2) { echo 'col-md-25 col-lg-2 col-sm-3 '; } if($class == 2 && $r == 0) { echo 'hidden-md hidden-sm'; } if($class == 2 && $r == 5) { echo 'hidden-sm'; } ?> <?php if($class == 25) { echo 'col-md-25 col-lg-25 col-sm-3 '; } if($class == 25 && $r == 0) { echo 'hidden-sm'; } ?>">
			    				<?php include('catalog/view/theme/'.$config->get('config_template').'/template/new_elements/product.tpl'); ?>
			    			</div>
						<?php $i++; } ?>
						<?php if($i > 0) { echo '</div></div></div>'; } ?>
					</div>
				</div>
			</div>
		</div>
		<?php $s++; } ?>
	</div>
</div>
 
<script type="text/javascript">
$('#tab<?php echo $id; ?> a').click(function (e) {
  e.preventDefault();
  $(this).tab('show');
})
</script>
<?php } else { ?>
<?php foreach($tabs as $tab) { ?>
<div class="box clearfix box-with-products <?php if($carousel != '0') { echo 'with-scroll';  } ?> box-no-advanced">
  <?php if($carousel != 0) { ?>
  <!-- Carousel nav -->
  <a class="next" href="#myCarousel<?php echo $id; ?>" id="myCarousel<?php echo $id; ?>_next"><span></span></a>
  <a class="prev" href="#myCarousel<?php echo $id; ?>" id="myCarousel<?php echo $id; ?>_prev"><span></span></a>
  
  <script type="text/javascript">
  $(document).ready(function() {
    var owl<?php echo $id; ?> = $(".box #myCarousel<?php echo $id; ?> .carousel-inner");
  	
    $("#myCarousel<?php echo $id; ?>_next").click(function(){
        owl<?php echo $id; ?>.trigger('owl.next');
        return false;
      })
    $("#myCarousel<?php echo $id; ?>_prev").click(function(){
        owl<?php echo $id; ?>.trigger('owl.prev');
        return false;
    });
      
    owl<?php echo $id; ?>.owlCarousel({
    	  slideSpeed : 500,
        singleItem:true,
        <?php if($page_direction[$config->get( 'config_language_id' )] == 'RTL'): ?>
        direction: 'rtl'
        <?php endif; ?>
     });
  });
  </script>
  <?php } ?>
	
  <div class="box-heading"><?php echo $tab['heading']; ?></div>
  <div class="strip-line"></div>
  <div class="clear"></div>
  <div class="box-content products">
    <div class="box-product">
    	<div id="myCarousel<?php echo $id; ?>" <?php if($carousel != 0) { ?>class="carousel slide"<?php } ?>>
    		<!-- Carousel items -->
    		<div class="carousel-inner">
    			<?php $i = 0; $row_fluid = 0; $item = 0; foreach ($tab['products'] as $product) { $row_fluid++; ?>
	    			<?php if($i == 0) { $item++; echo '<div class="active item"><div class="product-grid"><div class="row">'; } ?>
	    			<?php $r=$row_fluid-floor($row_fluid/$all)*$all; if($row_fluid>$all && $r == 1) { if($carousel != '0') { echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; $item++; } else { echo '</div><div class="row">'; } } else { $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } } ?>
	    			<div class="col-sm-<?php echo $class; ?> col-xs-6 <?php if($class == 2) { echo 'col-md-25 col-lg-2 col-sm-3 '; } if($class == 2 && $r == 0) { echo 'hidden-md hidden-sm'; } if($class == 2 && $r == 5) { echo 'hidden-sm'; } ?> <?php if($class == 25) { echo 'col-md-25 col-lg-25 col-sm-3 '; } if($class == 25 && $r == 0) { echo 'hidden-sm'; } ?>">
	    				<?php include('catalog/view/theme/'.$config->get('config_template').'/template/new_elements/product.tpl'); ?>
	    			</div>
    			<?php $i++; } ?>
    			<?php if($i > 0) { echo '</div></div></div>'; } ?>
    		</div>
		</div>
    </div>
  </div>
</div>
<?php } ?>
<?php } ?>