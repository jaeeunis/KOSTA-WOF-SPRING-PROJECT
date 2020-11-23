<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
	<jsp:include page="../includes/header-point-detail.jsp"></jsp:include>

	<title>����Ʈ ����</title>
	
	<!-- Main content -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="card bg-secondary border-0 mb-0">
					<div class="text-primary text-center mt-2 mb-3">
						<b>����Ʈ ����</b>
					</div>

					<form action="charging" method="post">
						<div class="form-group col-11 center">
							<label for="example-text-input" class="form-control-label">����
								�ݾ�</label> <input class="form-control" type="text" id="point-amount"
								name="point_amount" placeholder="�ݾ��� �Է����ּ���">
							<!-- onkeyup="inputNumberAutoComma(this)" -->
						</div>
						<div class="form-group col-11 center">
							<label for="example-search-input" class="form-control-label">�޸�
								�Է�</label> <input class="form-control" type="search" value="����"
								id="example-search-input" name="point_contents">
						</div>
						<div class="form-group col-11 center">
							<label for="example-password-input" class="form-control-label">��й�ȣ Ȯ��
								</label> <input class="form-control" type="password"
								id="example-password-input">
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary my-4">�����ϱ�</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 
		<script type="text/javascript">
			//�˾�â ���� ��, �θ�â ���ΰ�ħ
			opener.document.location.reload();
			self.close();
		</script>
	 -->

	<script type="text/javascript">
		//<���� �ݾ�>�Է� => ���ڸ� ����, õ���� �޸�
		function inputNumberAutoComma(obj) {
			// �޸�( , )�� ��쵵 ���ڷ� �νĵǱ⶧���� �޸��� ���� �����Ѵ�.
			var deleteComma = obj.value.replace(/\,/g, "");
			// �޸�( , )�� �����ϰ� ���ڰ� �ԷµǾ������� Ȯ���Ѵ�.
			if (isFinite(deleteComma) == false) {
				alert("���ڴ� �Է��Ͻ� �� �����ϴ�.");
				obj.value = "";
				return false;
			}
			// ������ ���ִ� �޸�( , )�� ������ �� ���� �Է°��� �ٽ� �޸�( , )�� �����Ѵ�.
			obj.value = inputNumberWithComma(inputNumberRemoveComma(obj.value));
		}
		// õ���� �̻��� ���ڿ� �޸�( , )�� �����ϴ� �Լ�
		function inputNumberWithComma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
		// �޸�( , )�� �� ���� �޸��� �����ϴ� �Լ�
		function inputNumberRemoveComma(str) {
			str = String(str);
			return str.replace(/[^\d]+/g, "");
		}
	</script>
	
	<jsp:include page="../includes/footer.jsp"></jsp:include>	