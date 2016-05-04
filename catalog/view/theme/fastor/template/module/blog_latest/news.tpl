<?php
if($this->registry->has('theme_options') == false) { 
 header("location: themeinstall/index.php"); 
 exit; 
}
$theme_options = $this->registry->get('theme_options');
?>
<div class="box blog-module blog-latest-posts box-no-advanced">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="strip-line"></div>
    <div class="box-content box-latest-posts">
        <?php if(!empty($articles)):?> 
        <div class="news v1 row clearfix">
            <?php foreach($articles as $article):?>
            <div class="col-sm-4 col-xs-6">
                <div class="media">
                    <div class="thumb-holder">
                        <img alt="" src="<?php echo $article['thumb'] ?>">
                    </div>

                    <div class="media-body" onclick="window.location.href = '<?php echo $article['href']; ?>'">
                        <?php if($article['tags']){ ?>
                        <div class="tags">
                            <?php foreach($article['tags'] as $tag){ ?>
                            <a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a>
                            <?php } ?>
                        </div>
                        <?php } ?>
                        <div class="bottom">
                            <div class="date-published"><?php echo date('d.m.Y', strtotime($article['date_published'])); ?></div>
                            <h5><?php echo $article['title'] ?></h5>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
        <?php endif; ?>
    </div>
</div>