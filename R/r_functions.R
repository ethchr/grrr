grrr <- new.env(parent = emptyenv())

#' Initialize grrr
#'
#' @param cutoff how many errors should occur in a session
#'     before playing an audio file and resetting counter.
#'     Defaults to 10 errors.
#' @param mov the absolute distance from the cutoff argument
#'     that the audio file will play (to make the exact count)
#'     a surprise. Defaults to 2. 
#' @param audio which audio file to play. Default
#'     is a DBZ shout.
#' @return an initialized session with argh
#' @export
#' @rdname init
#'
#' @examples
#' init_grrr()

init_grrr <- function(
  cutoff = 10,
  mov = 2,
  audio = "goku"
){
  cutplus <- cutoff + mov
  cutmin  <- cutoff - mov
  grrr$count <- 0
  grrr$cutoff <- sample(cutmin:cutplus, 1)
  grrr$audio <- audio
  options("old_error" = getOption("error"))
  options( error = function(...){
    err <- geterrmessage()
    error_counter(err)
  })
  
}

#' @export
#' @rdname init
stop_grrr <- function(){
  options("error" = getOption("old_error"))
}

error_counter <- function(err){
  grrr$count <- grrr$count + 1
  if (grrr$count >= grrr$cutoff){
    tuneR::play("C:/Users/Ethan/Downloads/dragon_ball_z_scream.wav")  
    grrr$count <- 0
  }
  #sound <- system.file(
  #  paste0(audio, "_errors.wav"),
  #  package = "grrr"
  #)
}
