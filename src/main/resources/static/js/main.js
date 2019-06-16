$(function () {
    $('.deleteProject').each(function () {
        var $this = $(this);
        $this.on("click", function () {
            let id = $(this).data('id');
            const isConfirmed = confirm("Вы уверены что хотите удалить?");
            if (isConfirmed) {
                $.ajax({
                    type: "DELETE",
                    url: '/project/' + id,
                    dataType: "json",
                    contentType: "application/json;charset=utf-8"
                })
                    .complete(function (data) {
                        location.reload();
                    });
            } else {
                console.log("net");
            }
        });
    })
});