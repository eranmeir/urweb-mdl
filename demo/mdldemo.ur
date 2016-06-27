open Mdl

fun classfold (xs : list css_class) : css_class = List.foldl classes null xs

fun pre () : page =
    <xml>
      <head>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
        <link rel="stylesheet" href="https://code.getmdl.io/1.1.3/material.indigo-pink.min.css" />
      </head>
    </xml>



fun badgeDemo () : transaction page =
    return
    <xml>
      { pre() }
      <body>
        <br/>
        <!-- Number badge on icon -->
        <div class={classfold (material_icons ::  mdl_badge :: []) } data-badge="1">account_box</div>
        <!-- Icon badge on icon -->
        <div class={ classfold (material_icons :: mdl_badge :: []) } data-badge="♥">account_box</div>
      </body>
    </xml>



fun buttonDemo () : transaction page =
    let
        val my_classes = mdl_button :: mdl_js_button :: mdl_button__fab :: mdl_button__colored :: []
    in
        return
        <xml>
          { pre() }
          <body>
            <button class={classfold my_classes}>
              <i class={material_icons}>add</i>
            </button>
          </body>
        </xml>
    end

fun cardDemo () : transaction page =
    return
    <xml>
     { pre() }
    <body>
      <div class={mdl_card}>
        <div class={mdl_card__title}>
          <h2 class={mdl_card__title_text}>Auckland Sky Tower<br/>Auckland, New Zealand</h2>
        </div>
        <div class={mdl_card__media}>
          (*<img src="skytower.jpg" width="173" height="157" border="0" alt=""  style="padding:10px;" /> *)
        </div>
        <div class={mdl_card__supporting_text}> The Sky Tower is an observation and telecommunications tower located in Auckland, New Zealand. It is 328 metres (1,076 ft) tall, making it the tallest man-made structure in the Southern Hemisphere.
                                                                                                                                                                                        </div>
        <div class={mdl_card__actions}>
          <a class={classfold (mdl_button :: mdl_button__colored :: mdl_js_button :: mdl_js_ripple_effect :: [])}>View Updates </a>
        </div>
      </div>
    </body>
    </xml>


fun progressDemo () : transaction page =
      eid <- fresh;
      buffid <- fresh;
      return 
      <xml>
        { pre() }
        <body onload={ MdlFfi.setProgress eid 44 } >
              <div>
                <h3>Progress bar</h3>
                <div id={eid} class={classfold ( mdl_js_progress :: mdl_progress :: [])}></div>
              </div>
              <div>
                <h3>Indeterminate</h3>
                <div class={classfold ( mdl_progress__indeterminate :: mdl_js_progress :: mdl_progress :: [])}></div>
              </div>
              <div>
                <h3>Buffering</h3>
                <button value="Set buffering" onclick={ fn _ =>
                                                           MdlFfi.setProgress buffid 33;
                                                           MdlFfi.setBuffer buffid 88 }/>
                <div id={buffid} class={classfold ( mdl_js_progress :: mdl_progress :: [])}></div>
              </div>
        </body>
      </xml> 




fun main () : transaction page =
    return
    <xml>
    <body>
    <a link={badgeDemo ()}>Badge Demo</a><br/>
    <a link={buttonDemo ()}>Button Demo</a><br/>
    <a link={cardDemo ()}>Card Demo</a><br/>
    <a link={progressDemo ()}>Progress Demo</a><br/>
    </body>
    </xml>

