<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller as Controller;

class ApiController extends Controller
{
    /**
     * success response method.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendResponse($message, $result = null): \Illuminate\Http\JsonResponse
    {
        if (!empty($result)) {
            $response = [
                'success' => true,
                'data' => $result,
                'message' => $message,
            ];
        } else {
            $response = [
                'success' => true,
                'message' => $message,
            ];
        }

        return response()->json($response, 200);
    }


    /**
     * return error response.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function sendError($error, $errorMessages = [], $code = 404): \Illuminate\Http\JsonResponse
    {
        $response = [
            'success' => false,
            'message' => $error,
        ];


        if (!empty($errorMessages)) {
            $response['data'] = $errorMessages;
        }


        return response()->json($response, $code);
    }
}
