// SkillHub Training Academy - toast notification helper
// Call window.shToast(message, type) where type is "success" or "error"

(function () {
    function ensureStack() {
        var stack = document.querySelector('.toast-stack');
        if (!stack) {
            stack = document.createElement('div');
            stack.className = 'toast-stack';
            document.body.appendChild(stack);
        }
        return stack;
    }

    window.shToast = function (message, type) {
        if (!message) return;
        var isError = type === 'error';
        var stack = ensureStack();

        var toast = document.createElement('div');
        toast.className = 'sh-toast' + (isError ? ' is-error' : '');

        var icon = document.createElement('div');
        icon.className = 'toast-icon';
        icon.innerHTML = '<i class="bi ' + (isError ? 'bi-x-lg' : 'bi-check-lg') + '"></i>';

        var text = document.createElement('div');
        text.className = 'toast-text';
        text.textContent = message;

        var closeBtn = document.createElement('button');
        closeBtn.type = 'button';
        closeBtn.className = 'toast-close';
        closeBtn.innerHTML = '&times;';

        var progress = document.createElement('div');
        progress.className = 'toast-progress';

        toast.appendChild(icon);
        toast.appendChild(text);
        toast.appendChild(closeBtn);
        toast.appendChild(progress);
        stack.appendChild(toast);

        function remove() {
            toast.classList.add('is-leaving');
            setTimeout(function () { toast.remove(); }, 220);
        }

        closeBtn.addEventListener('click', remove);
        setTimeout(remove, 4000);
    };

    window.shToastFromFlash = function () {
        var el = document.getElementById('flash-data');
        if (!el) return;
        var success = el.getAttribute('data-success');
        var error = el.getAttribute('data-error');
        if (success) window.shToast(success, 'success');
        if (error) window.shToast(error, 'error');
    };

    document.addEventListener('DOMContentLoaded', window.shToastFromFlash);
})();
