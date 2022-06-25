$(document).ready(function(){

    var emailString  = $('.email').text();
    console.log(emailString);

    function load_addresses(){
        $.ajax({
            type: "GET",
            data: {
                email: emailString
            },
            url: "show-address",
            success: function (data) {
                //window.alert(data[0].indirizzo);
                console.log(Object.keys(data).length);
                if(data == undefined || !data.length)
                    $('.table').append("<tr><td>Non hai indirizzi registrati</td><td></td></tr>");
                else {
                    var lenght = Object.keys(data).length;
                    for (var i = 0; i < lenght; i++) {
                        $('.table').append(
                            "<tr>" +
                            "   <td>" +
                            "       <input type=\"text\" class=\"input-txt_fld add_fld\" value='" + data[i].indirizzo + "'></td>" +
                            "       <input type=\"hidden\" class=\"hidden_fld\" value='" + data[i].indirizzo + "'> " +
                            "   <td>" +
                            "       <button class=\"delete-btn circle-btn\"><i class=\"fa-solid fa-trash\"></i></button> &nbsp;&nbsp;" +
                            "       <button class=\"save-btn circle-btn\"><i class=\"fa-solid fa-floppy-disk\"></i></button>" +
                            "   </td>" +
                            "</tr>");
                    }
                }

            }
        });
    }

    load_addresses();

    function cleanup_table(){
        /*
            Elimina tutti i tr della tabella tranne
            la riga righe_tab[0] (ovvero l'intestazione)
         */
        var righe_tab = $('.table tr');
        console.log(righe_tab.length);
        for(var i = 1; i < righe_tab.length; i++)
            righe_tab[i].remove();
    }

    $('.add-btn').click(function(){
        var address_tag = $(this).siblings('.add_fld');
        var address = address_tag.val();
        console.log(address.length)
        if(address.length == 0)
            $('#err_msg').text("Non puoi inserire un indirizzo vuoto!");
        else {

            $.ajax({
                type: "GET",
                data: {
                    email: emailString,
                    indirizzo: address
                },
                url: "add-address",
                success: function (){
                    cleanup_table();
                    load_addresses();
                }
            });
        }
        address_tag.val("");
    });

  $('.table').on('click', '.delete-btn', function(){

      var address = $(this).closest('tr').find('.input-txt_fld').val();
      //var row = $(this).closest('tr');

      $.ajax({
          type: "GET",
          data: {
              email: emailString,
              indirizzo: address
          },
          url: "remove-address",
          success: function () {
              cleanup_table();
              load_addresses();
          }
      });

  });

  $('.table').on('click', '.save-btn', function () {
      var addressToUpdate = $(this).closest('tr').find('.input-txt_fld').val();
      var addressBefore = $(this).closest('tr').find('.hidden_fld').val();

      $.ajax({
          type: "GET",
          data: {
              email: emailString,
              newAddress: addressToUpdate,
              oldAddress: addressBefore
          },
          url: "update-address",
          success: function () {
              cleanup_table();
              load_addresses();
          }
      });

      //Alternativa
      /*
      $.get("remove-address?email=" + emailString + "&indirizzo=" + address,
          function(status){
              console.log(status);
              //console.log("Data: " + data + "\nStatus: " + status);
          });*/

  });
});