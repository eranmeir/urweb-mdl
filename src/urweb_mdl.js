function isElementUpgraded_(element, jsClass) {
    var dataUpgraded = element.getAttribute('data-upgraded');
    return dataUpgraded && dataUpgraded.indexOf(jsClass) !== -1;
}

function setProgress(eid, p) {
    console.log('setProgress: ' + eid);
    var e = document.querySelector("#" + eid);
    if (isElementUpgraded_(e, 'MaterialProgress')) {
        e.MaterialProgress.setProgress(p);
    }
    else {
        e.addEventListener('mdl-componentupgraded', function() {
            this.MaterialProgress.setProgress(p);
        });
    }
}

function setBuffer(eid, p) {
    console.log('setBuffer: ' + eid);
    var e = document.querySelector("#" + eid);
    if (isElementUpgraded_(e, 'MaterialProgress')) {
        e.MaterialProgress.setBuffer(p);
    }
    else {
        e.addEventListener('mdl-componentupgraded', function() {
            this.MaterialProgress.setBuffer(p);
        });
    }
}
