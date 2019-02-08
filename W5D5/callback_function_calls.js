// Simple Timeout

window.setTimeout( function () {
    alert('HAMMERTIME');
}, 5000);


// Timeout plus closure

function hammerTime (time) {
    window.setTimeout (function () {
        alert(`${time} is hammertime!`)
    });
};

