class AllowedSwipeDirections {

  const AllowedSwipeDirections.all()
      : right = true,
        left = true;
        

  const AllowedSwipeDirections.none()
      : right = false,
        left = false;

  const AllowedSwipeDirections.only()
      : right = true,
        left = false;
  

  final bool right;
  
  final bool left;

}