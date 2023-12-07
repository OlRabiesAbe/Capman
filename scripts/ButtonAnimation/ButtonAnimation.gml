/// @func ButtonAnimation(type, selected)
/// @param {enum} type
/// @return {undefined} N/A
/// @private

function ButtonAnimation(type) constructor {
    self.type = type;
	state = e_anim_state.idle;
	selected_prev = false;
	pos = 0;
	
	/// @func step()
	/// @param {bool} selected
	/// @return {undefined} N/A
	/// @private
	
	static step = function(selected) {
	    var target = 0;
	    var attr = oMenu.anim;
	    
	    if (!selected) {
	        // If not selected move back to idle position
	        state = e_anim_state.decrease;
	        target = 0;
	        
	        if (pos == 0) state = e_anim_state.idle;
	    } else {
	        switch type {
	            // Sidebar
	            case e_anim_type.sidebar:
                    state = e_anim_state.increase;
                    target = attr.sidebar.travel_dis;
                    break;
                    
                // Button
                case e_anim_type.button:
                    switch state {
                        case e_anim_state.idle:
                            state = e_anim_state.increase;
                            break;
                            
                        case e_anim_state.increase:
                            target = attr.button.travel_dis;
                            if (pos == target) state = e_anim_state.decrease;
                            break;
                            
                        case e_anim_state.decrease:
                            target = 0;
                            if (pos == target) state = e_anim_state.stop;
                            break;
                    }
                    break;
	        }
	    }
	    
	    // Skip if idle
	    if (state == e_anim_state.idle or state == e_anim_state.stop) exit;
	    
	    // Move position towards target
		if (abs(pos - target) < 0.5) {
		    pos = target;
		} else {
		    var amount = type == e_anim_type.button ? attr.button.speed : attr.sidebar.speed;
		    pos = lerp(pos, target, amount);
		}
	}
}