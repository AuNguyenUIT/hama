function showMessage(message, type) {
    if (type === 'success') {
        toastr.success(message);
    }
    if (type === 'error') {
        toastr.error(message);
    }
    if (type === 'warning') {
        toastr.warning(message);
    }
    if (type === 'info') {
        toastr.info(message);
    }
}