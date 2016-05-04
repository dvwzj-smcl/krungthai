<div class="box-links" style="margin-top: 40px;">

    <div class="row">
        <?php foreach($links as $link){ ?>
        <?php if($link['status']==1){ ?>
        <div class="col-md-6" style="margin-bottom: 20px;">
            <div class="box-link-download">
            <a href="<?php echo $link['link_video']; ?>">
                <iframe width="555" height="314" src="<?php echo str_replace('watch?v=', 'embed/', $link['link_video']); ?>" frameborder="0" allowfullscreen=""></iframe>
            </a>
            </div>
        </div>
        <?php } ?>
        <?php } ?>
    </div>
</div>