@bind_add_muscle_item = ->    
    $('#add_muscle').click (e) ->
        e.stopPropagation
        lastRepeatingGroup = $('.muscle_set_item').last()
        lastRepeatingGroup.clone().insertAfter(lastRepeatingGroup)
        return
    return