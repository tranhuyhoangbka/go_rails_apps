$(document).ready ->
  $("input#book_image").bind("change", (e) ->
    size = this.files[0].size/1024/1024
    name = this.files[0].name
    type = this.files[0].type
    if type != "image/jpeg" && type != "image/png" && type != "image/gif"
      alert("File that you select be not a image. Please select correct image format")
    if size > 2
      alert("Image that you select be so big. Please select smaller image"))

