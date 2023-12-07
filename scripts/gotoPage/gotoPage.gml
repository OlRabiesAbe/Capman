// This function is used by the menu system, you don't have to worry about it!
// Goes to supplied menu page

/// @func gotoPage(page)
/// @param {array} page
/// @return {undefined} N/A

function gotoPage(_page) {
	with (oMenu) {
		ds_stack_push(prev_pages, [page, menu_option]);
		
		page = _page;
		menu_option = 0;
		sn = audio.page_shift;
		anim_array = [];
		scrolling_y = undefined;
	}
}