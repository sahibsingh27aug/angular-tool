<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->get('/api/users', function (Request $request, Response $response) {
    $q = "SELECT * FROM users";

    try {
        $conn = new db;
        $run = $conn->connect();

        $stmt = $run->query($q);
        $users = $stmt->fetchAll(PDO::FETCH_OBJ);
        echo json_encode($users);
    } catch (PDOException $e) {
        $error["error"]["text"] = $e->getMessage();
        echo json_encode($error);
    }
});

$app->get('/api/users/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    $q = "SELECT * FROM users WHERE id=$id";

    try {
        $conn = new db;
        $run = $conn->connect();

        $stmt = $run->query($q);
        $users = $stmt->fetch(PDO::FETCH_OBJ);
        $run = null;
        if (!$users) {
            throw new \Exception("User not found");
        }
        $users->tg_name = [];
        $tg_id = explode(',', $users->toolGroups);
        foreach ($tg_id as $k1 => $v1) {
            $run = $conn->connect();
            $stmt1 = $run->query("SELECT * from toolGroups where id=$v1");
            $data = $stmt1->fetch(PDO::FETCH_OBJ);
            if ($data) {
                $users->tg_name[] = $data;
            }
        }
        echo json_encode($users);
    } catch (\Exception $e) {
        $error["error"]["text"] = $e->getMessage();
        echo json_encode($error);
    }
});

$app->get('/api/toolgroups/{id}', function (Request $request, Response $response) {
    $id = $request->getAttribute('id');
    $q = "SELECT * FROM toolGroups WHERE id=$id";

    try {
        $conn = new db;
        $run = $conn->connect();

        $stmt = $run->query($q);
        $users = $stmt->fetch(PDO::FETCH_OBJ);
        $run = null;
        if (!$users) {
            throw new \Exception("Tool Group not found");
        }
        $users->tool_name = [];
        $tg_id = explode(',', $users->tool_id);
        foreach ($tg_id as $k1 => $v1) {
            $run = $conn->connect();
            $stmt1 = $run->query("SELECT * from tools where id=$v1");
            $data = $stmt1->fetch(PDO::FETCH_OBJ);
            if ($data) {
                $users->tool_name[] = $data;
            }
        }
        echo json_encode($users);
    } catch (\Exception $e) {
        $error["error"]["text"] = $e->getMessage();
        echo json_encode($error);
    }
});
