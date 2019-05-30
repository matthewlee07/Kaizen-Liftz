@bind_add_muscle_item = ->    
    $('body').on 'click', '#add_muscle', (e) ->
        e.stopPropagation
        $('.muscle_set').append($('.muscle_set_item_container').html())        
    return
return