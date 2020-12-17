<?php
//gỡ session alert
if (isset($_SESSION['status-insert'])) {
    unset($_SESSION['status-insert']);
}
if (isset($_SESSION['status-update'])) {
    unset($_SESSION['status-update']);
}
if (isset($_SESSION['status-delete'])) {
    unset($_SESSION['status-delete']);
}