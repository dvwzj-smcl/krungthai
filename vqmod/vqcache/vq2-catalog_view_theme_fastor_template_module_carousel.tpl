<?php if($this->registry->has('theme_options') == true) { 
$theme_options = $this->registry->get('theme_options');
$config = $this->registry->get('config');
$page_direction = $theme_options->get( 'page_direction' ); ?>
<div class="box clearfix box-with-products with-scroll">
  <!-- Carousel nav -->
  <a class="next" href="#our_brands" id="brands_next"><span></span></a>
  <a class="prev" href="#our_brands" id="brands_prev"><span></span></a>
	
  <div class="box-heading"><?php if($theme_options->get( 'our_brands_text', $config->get( 'config_language_id' ) ) != '') { echo html_entity_decode($theme_options->get( 'our_brands_text', $config->get( 'config_language_id' ) )); } else { echo 'Our brands'; } ?></div>
  <div class="clear"></div>
  <div class="box-content products">     
     <div id="our_brands" class="owl-carousel carousel-brands">
       
			<?php
			$idx = 1;
			$lIdx = count($banners);
			foreach ($banners as $banner) {
				if($idx == 1) {
				   echo '<div class="item text-center">';
				}
				if($banner['link']) {
					echo '<a href="'.$banner['link'].'"><img src="'.$banner['image'].'" alt="'.$banner['title'].'" class="img-responsive" /></a>';
				} else {
					echo '<img src="'.$banner['image'].'" alt="'.$banner['title'].'" class="img-responsive" />';
				}
				if($idx == $lIdx) {
					echo '</div>';
				} else if($idx%2 == 0) {
					echo '</div><div class="item text-center">';
				}
				$idx++;
			}
			?>
			








     </div>
     <script type="text/javascript"><!--
     
     var ourbrands = $('#our_brands').owlCarousel({
     	items: 6,
     	autoPlay: 3000,
     	navigation: false,
     	<?php if($page_direction[$config->get( 'config_language_id' )] == 'RTL'): ?>
     	direction: 'rtl'
     	<?php endif; ?>
     });
     
     $("#brands_next").click(function(){
         ourbrands.trigger('owl.next');
         return false;
       });
       
     $("#brands_prev").click(function(){
         ourbrands.trigger('owl.prev');
         return false;
     });
     --></script>
  </div>
</div>
<?php } ?>