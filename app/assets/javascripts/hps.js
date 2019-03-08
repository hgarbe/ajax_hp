var currentHp = {};
var showForm = false;

$(document).ready( function() {

  $("#toggle").on("click", function() {
    toggle();
  })

  function toggle() {
    showForm = !showForm;
    $("#hp-form").remove();
    $("#hps-list").toggle();

    if (showForm) {
      $.ajax({
        url: "/hp_form",
        method: "GET"
      }).done(function (html) {
        $("#toggle").after(html);
      })
    }
  }

  $(document).on("submit", "#hp-form form", function(e) {
    // this prevents the page from reloading when submitted
    e.preventDefault();
    var data = $(this).serializeArray();
    $.ajax({
      url: "/hps",
      method: "POST",
      dataType: "JSON",
      data: data
    }).done( function(hp) {
      toggle();
      var g = '<li class="hp-item" data-id="' + hp.id + '" data-name="' + hp.name + '">' + hp.name +
        ' - ' + game.description + '</li>';
      $("#hps-list").append(g);
    })
  })

  $(document).on("click", ".hp-item", function() {
    currentHp.id = this.dataset.id;
    currentHp.name = this.dataset.name;
    $.ajax({
      url: "/hps/" + currentHp.id + "/characters",
      method: "GET",
      dataType: "JSON"
    }).done( function(characters) {
      var list = $("#characters");
      $("#hp").text("Characters in " + currentHp.name);
      list.empty();
      characters.forEach( function(char) {
        var li = '<li data-character-id="' + char.id + '">' + char.name + ' - ' + char.quote + '</li>';
        list.append(li);
      })
    })
  })
})
