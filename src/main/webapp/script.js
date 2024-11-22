let slideIndex = 0;
const slides = document.querySelector('.carousel-slide');
const totalSlides = document.querySelectorAll('.carousel-item').length;

function moveSlide(n) {
    slideIndex += n;

 
    if (slideIndex >= totalSlides) {
        slideIndex = 0;
    } else if (slideIndex < 0) {
        slideIndex = totalSlides - 1;
    }

   
    slides.style.transform = `translateX(${-slideIndex * 100}%)`;
}


setInterval(() => {
    moveSlide(1);
}, 3000);


    


