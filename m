Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DD552E341
	for <lists+squashfs-devel@lfdr.de>; Fri, 20 May 2022 05:45:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nrtZj-0007Ht-34; Fri, 20 May 2022 03:45:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <hsinyi@chromium.org>) id 1nqYCK-0003Sj-21
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gGywS9bHxk5TZLlg9cekFTB0weMYTqUUeiNtr9tZHho=; b=HEDNdRexSxUKY201kVNaKlmwf2
 pcaIjwFhw2XPs8kR86fdKoZE5kC/Ti/wME4H7BOL1NdRVIbjzLKlFVjX27zGLkTQptSDrzKLTesgH
 crd2mFiks0F6fhQFJsAU9Zi9cWUjS0MTuLq1arqgbQ3QT4p7QQHjELbXcaGySvzXpgO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gGywS9bHxk5TZLlg9cekFTB0weMYTqUUeiNtr9tZHho=; b=R
 Wm9tmcMYzk5Pe9G6CYf1ZU4KoDoFBf/6h8jUFCSQbsrwzLJzXVcUPFYm4pfPfjE2MAxM6qgZ+k/en
 aM+1B1XOjtmp7k0mrUbNQtoRWhecC9A326Gsg2d+/uQC39QIUdBVP73fpquJ/DEK8HVBX37ULagXP
 oI4boJtIuCbS0Qno=;
Received: from mail-pf1-f170.google.com ([209.85.210.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nqYCA-00042o-0s
 for squashfs-devel@lists.sourceforge.net; Mon, 16 May 2022 10:43:30 +0000
Received: by mail-pf1-f170.google.com with SMTP id 204so13672613pfx.3
 for <squashfs-devel@lists.sourceforge.net>;
 Mon, 16 May 2022 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGywS9bHxk5TZLlg9cekFTB0weMYTqUUeiNtr9tZHho=;
 b=aF8Vk35o5gqPuerIPs6Aw+pBQ/K6j6dF1s+VEzN+mv48EULn6pi4887t2cp7eG1SuV
 Cg5So539af0OUXOeoR0S8BqNWeEEh72naBPz0RlsSudJ5mqA5Q4b1SZJ1Sm7pyluQGG2
 Rt3Fr0G55MrmNV1QJwj3LwOPs5TGPB+XMwDJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gGywS9bHxk5TZLlg9cekFTB0weMYTqUUeiNtr9tZHho=;
 b=ON1wCSNd21r0GXjTNl/O1EzqCpy1177qiIsPq4jYw5tuWzTAGI5ivrQGFU6reG4gWa
 SctCAuzIfRvtYWdXXwL9853rMU9S9wrTv+oRypG/ouBibqmPxZIP2sdZWkaovXyOGNbs
 QzelYf1EMpEpuDLgeeJH5unt+l9xjiPZljhhLw5uadCtNGmVS8isepY7R0Zun7vCUy25
 MoIwt/2G7D1B+032hQYHC/sgZwUNAXZrOiAbsInfc8lIRhANTWE10eKf89xiKgWVegwB
 CXcyASqD5OumSrHMzotcART7i37Tm3TkxL8KIkA7L2V1aD2zSQhPQ6adYxpjObIROIol
 7zhQ==
X-Gm-Message-State: AOAM530X3d9hIjRP4nI1G/kP3KrRmaccyqlkz5c4F/W+kO/WNnvltQ4p
 Vo+edBpWLb3eUkTTAu4+3Ivv4Q==
X-Google-Smtp-Source: ABdhPJyncUK3MZU/GJsE8dgsnjOCQKmWoiGt3yIx9nl/FcnEK7brtYhcPM7Q3kN1VggUz9jh08uisg==
X-Received: by 2002:a62:6410:0:b0:4f3:9654:266d with SMTP id
 y16-20020a626410000000b004f39654266dmr16640705pfb.59.1652697772064; 
 Mon, 16 May 2022 03:42:52 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cdcb:c865:6f65:d875])
 by smtp.gmail.com with ESMTPSA id
 10-20020a17090a01ca00b001cd4989ff70sm6191232pjd.55.2022.05.16.03.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:42:51 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Phillip Lougher <phillip@squashfs.org.uk>,
 Matthew Wilcox <willy@infradead.org>,
 Xiongwei Song <Xiongwei.Song@windriver.com>
Date: Mon, 16 May 2022 18:42:08 +0800
Message-Id: <20220516104209.1407388-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit c1f6925e1091("mm: put readahead pages in cache
 earlier")
 requires fs to implement readahead callback. Otherwise there will be a
 performance
 regression. Commit 9eec1d897139("squashfs: provide backing_dev_info in order
 to disable read-ahead") mitigates the performance drop issue for squashfs
 by closing readahead for it. 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.170 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqYCA-00042o-0s
X-Mailman-Approved-At: Fri, 20 May 2022 03:45:10 +0000
Subject: [Squashfs-devel] [PATCH 0/3] Implement readahead for squashfs
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "squashfs-devel @ lists . sourceforge . net"
 <squashfs-devel@lists.sourceforge.net>, Zhang Yi <yi.zhang@huawei.com>,
 linux-kernel@vger.kernel.org, "linux-mm @ kvack . org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Commit c1f6925e1091("mm: put readahead pages in cache earlier") requires
fs to implement readahead callback. Otherwise there will be a
performance regression.

Commit 9eec1d897139("squashfs: provide backing_dev_info in order to
disable read-ahead") mitigates the performance drop issue for squashfs
by closing readahead for it.

This series implements readahead callback for squashfs. The previous
discussion are in [1] and [2].

[1] https://lore.kernel.org/all/CAJMQK-g9G6KQmH-V=BRGX0swZji9Wxe_2c7ht-MMAapdFy2pXw@mail.gmail.com/T/
[2] https://lore.kernel.org/linux-mm/Yn5Yij9pRPCzDozt@casper.infradead.org/t/#m4af4473b94f98a4996cb11756b633a07e5e059d1

Hsin-Yi Wang (3):
  Revert "squashfs: Convert squashfs to read_folio"
  Revert "squashfs: provide backing_dev_info in order to disable
    read-ahead"
  squashfs: implement readahead

 fs/squashfs/file.c    | 82 +++++++++++++++++++++++++++++++++++++++++--
 fs/squashfs/super.c   | 33 -----------------
 fs/squashfs/symlink.c |  5 ++-
 3 files changed, 81 insertions(+), 39 deletions(-)

-- 
2.36.0.550.gb090851708-goog



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
